//! APL Parser implementing classical right-to-left associative grammar.
//!
//! Parses statements, vectors, dfns, assignments, and operator-derived functions.

use crate::apl::token::Token;
use crate::apl::ast::{Expr, Primitive, Operator, Program};
use crate::tensor::Tensor;
use num_complex::Complex64;

pub struct Parser {
    tokens: Vec<Token>,
    pos: usize,
}

impl Parser {
    pub fn new(tokens: Vec<Token>) -> Self {
        Self { tokens, pos: 0 }
    }

    pub fn parse_program(&mut self) -> Result<Program, String> {
        let mut statements = Vec::new();

        while !self.is_at_end() {
            // Skip separators
            if self.match_token(&[Token::Separator]) {
                continue;
            }
            if self.is_at_end() {
                break;
            }

            let stmt = self.parse_statement()?;
            statements.push(stmt);

            // Optional separator
            self.match_token(&[Token::Separator]);
        }

        Ok(Program { statements })
    }

    fn parse_statement(&mut self) -> Result<Expr, String> {
        // Check for assignment: ID ← Expr
        if let Token::Identifier(ref name) = self.peek() {
            if self.peek_next() == Some(&Token::Assign) {
                let var_name = name.clone();
                self.advance(); // consume ID
                self.advance(); // consume Assign
                let rhs = self.parse_expression()?;
                return Ok(Expr::Assign {
                    name: var_name,
                    val: Box::new(rhs),
                });
            }
        }

        self.parse_expression()
    }

    /// Parse right-to-left expression.
    pub fn parse_expression(&mut self) -> Result<Expr, String> {
        let mut terms = Vec::new();

        // Read all terms until separator, closing paren/bracket/brace, or EOF
        while !self.is_at_end()
            && !matches!(
                self.peek(),
                Token::Separator | Token::RParen | Token::RBracket | Token::DfnClose
            )
        {
            let term = self.parse_term()?;
            terms.push(term);
        }

        if terms.is_empty() {
            return Err("Empty expression".to_string());
        }

        // Fold terms from right to left
        self.fold_terms_right(terms)
    }

    fn fold_terms_right(&self, terms: Vec<Expr>) -> Result<Expr, String> {
        if terms.len() == 1 {
            return Ok(terms.into_iter().next().unwrap());
        }

        // Right-to-left reduction
        let mut right = terms.last().unwrap().clone();
        let mut idx = terms.len() - 1;

        while idx > 0 {
            idx -= 1;
            let current = &terms[idx];

            if self.is_callable(current) {
                // If there is an argument to the left that is not a known function, bind as dyadic
                if idx > 0 && !self.is_known_function(&terms[idx - 1]) {
                    let left = terms[idx - 1].clone();
                    right = Expr::Dyadic {
                        left: Box::new(left),
                        func: Box::new(current.clone()),
                        right: Box::new(right),
                    };
                    idx -= 1; // consumed left argument
                } else {
                    // Monadic call
                    right = Expr::Monadic {
                        func: Box::new(current.clone()),
                        arg: Box::new(right),
                    };
                }
            } else {
                // Juxtaposed nouns form a vector
                right = match (current, right) {
                    (Expr::Constant(ref c1), Expr::Constant(ref c2)) => {
                        let mut vals = Vec::new();
                        if let Some(s1) = c1.as_slice_f64() {
                            vals.extend_from_slice(s1);
                        }
                        if let Some(s2) = c2.as_slice_f64() {
                            vals.extend_from_slice(s2);
                        }
                        Expr::Constant(Tensor::vector_float(vals))
                    }
                    (lhs, Expr::VectorLiteral(mut list)) => {
                        list.insert(0, lhs.clone());
                        Expr::VectorLiteral(list)
                    }
                    (lhs, rhs) => Expr::VectorLiteral(vec![lhs.clone(), rhs]),
                };
            }
        }

        Ok(right)
    }

    fn is_known_function(&self, expr: &Expr) -> bool {
        matches!(
            expr,
            Expr::Prim(_) | Expr::OperatorDerived { .. } | Expr::Dfn { .. }
        )
    }

    fn is_callable(&self, expr: &Expr) -> bool {
        self.is_known_function(expr) || matches!(expr, Expr::Variable(_))
    }

    fn parse_term(&mut self) -> Result<Expr, String> {
        let token = self.advance();

        match token {
            Token::Number(n) => {
                // If followed by more numbers, consume them into a single vector constant!
                let mut vals = vec![n];
                while let Token::Number(next_n) = self.peek() {
                    vals.push(*next_n);
                    self.advance();
                }
                if vals.len() == 1 {
                    Ok(Expr::Constant(Tensor::scalar_float(vals[0])))
                } else {
                    Ok(Expr::Constant(Tensor::vector_float(vals)))
                }
            }
            Token::Complex(re, im) => Ok(Expr::Constant(Tensor::scalar_complex(Complex64::new(re, im)))),
            Token::StringLit(s) => {
                let chars: Vec<f64> = s.chars().map(|c| c as u32 as f64).collect();
                Ok(Expr::Constant(Tensor::vector_float(chars)))
            }
            Token::Identifier(id) => Ok(Expr::Variable(id)),
            Token::Alpha => Ok(Expr::Alpha),
            Token::Omega => Ok(Expr::Omega),

            // Primitives
            Token::Plus => self.parse_primitive_or_operator(Primitive::Plus),
            Token::Minus => self.parse_primitive_or_operator(Primitive::Minus),
            Token::Times => self.parse_primitive_or_operator(Primitive::Times),
            Token::Divide => self.parse_primitive_or_operator(Primitive::Divide),
            Token::Power => self.parse_primitive_or_operator(Primitive::Power),
            Token::Logarithm => self.parse_primitive_or_operator(Primitive::Logarithm),
            Token::Ceiling => self.parse_primitive_or_operator(Primitive::Ceiling),
            Token::Floor => self.parse_primitive_or_operator(Primitive::Floor),
            Token::Magnitude => self.parse_primitive_or_operator(Primitive::Magnitude),
            Token::Factorial => self.parse_primitive_or_operator(Primitive::Factorial),
            Token::Roll => self.parse_primitive_or_operator(Primitive::Roll),

            Token::Rho => self.parse_primitive_or_operator(Primitive::Rho),
            Token::Iota => self.parse_primitive_or_operator(Primitive::Iota),
            Token::Reverse => self.parse_primitive_or_operator(Primitive::Reverse),
            Token::Transpose => self.parse_primitive_or_operator(Primitive::Transpose),
            Token::Take => self.parse_primitive_or_operator(Primitive::Take),
            Token::Drop => self.parse_primitive_or_operator(Primitive::Drop),
            Token::Membership => self.parse_primitive_or_operator(Primitive::Membership),
            Token::Find => self.parse_primitive_or_operator(Primitive::Find),
            Token::Enclose => self.parse_primitive_or_operator(Primitive::Enclose),
            Token::Disclose => self.parse_primitive_or_operator(Primitive::Disclose),

            // Outer product: ∘. followed by primitive
            Token::OuterProduct => {
                let func_token = self.advance();
                let prim = self.token_to_primitive(&func_token)?;
                Ok(Expr::OperatorDerived {
                    op: Operator::OuterProduct,
                    func: Box::new(Expr::Prim(prim)),
                    arg_func: None,
                })
            }

            // Dfns: { ... }
            Token::DfnOpen => {
                let mut body = Vec::new();
                while !self.is_at_end() && self.peek() != &Token::DfnClose {
                    if self.match_token(&[Token::Separator]) {
                        continue;
                    }
                    if self.peek() == &Token::DfnClose {
                        break;
                    }
                    body.push(self.parse_statement()?);
                    self.match_token(&[Token::Separator]);
                }
                self.consume(&Token::DfnClose, "Expected '}' closing dfn")?;
                Ok(Expr::Dfn { body })
            }

            // Parenthesized expression
            Token::LParen => {
                let expr = self.parse_expression()?;
                self.consume(&Token::RParen, "Expected ')' closing expression")?;
                Ok(expr)
            }

            tok => Err(format!("Unexpected token in expression: {:?}", tok)),
        }
    }

    fn parse_primitive_or_operator(&mut self, prim: Primitive) -> Result<Expr, String> {
        let prim_expr = Expr::Prim(prim);

        // Check if immediately followed by an adverb/operator: /, \, ¨, ⍨
        if let Some(op_tok) = self.peek_operator() {
            self.advance();
            let op = match op_tok {
                Token::Reduce => Operator::Reduce,
                Token::Scan => Operator::Scan,
                Token::Each => Operator::Each,
                Token::Commute => Operator::Commute,
                Token::Rank => Operator::Rank,
                _ => return Ok(prim_expr),
            };
            Ok(Expr::OperatorDerived {
                op,
                func: Box::new(prim_expr),
                arg_func: None,
            })
        } else {
            Ok(prim_expr)
        }
    }

    fn peek_operator(&self) -> Option<Token> {
        match self.peek() {
            Token::Reduce | Token::Scan | Token::Each | Token::Commute | Token::Rank => {
                Some(self.peek().clone())
            }
            _ => None,
        }
    }

    fn token_to_primitive(&self, tok: &Token) -> Result<Primitive, String> {
        match tok {
            Token::Plus => Ok(Primitive::Plus),
            Token::Minus => Ok(Primitive::Minus),
            Token::Times => Ok(Primitive::Times),
            Token::Divide => Ok(Primitive::Divide),
            Token::Power => Ok(Primitive::Power),
            Token::Ceiling => Ok(Primitive::Ceiling),
            Token::Floor => Ok(Primitive::Floor),
            Token::Magnitude => Ok(Primitive::Magnitude),
            _ => Err(format!("Invalid primitive for operator: {:?}", tok)),
        }
    }

    fn peek(&self) -> &Token {
        if self.pos < self.tokens.len() {
            &self.tokens[self.pos]
        } else {
            &Token::Eof
        }
    }

    fn peek_next(&self) -> Option<&Token> {
        if self.pos + 1 < self.tokens.len() {
            Some(&self.tokens[self.pos + 1])
        } else {
            None
        }
    }

    fn advance(&mut self) -> Token {
        let tok = self.peek().clone();
        if self.pos < self.tokens.len() {
            self.pos += 1;
        }
        tok
    }

    fn match_token(&mut self, expected: &[Token]) -> bool {
        for exp in expected {
            if self.peek() == exp {
                self.advance();
                return true;
            }
        }
        false
    }

    fn consume(&mut self, expected: &Token, err: &str) -> Result<(), String> {
        if self.peek() == expected {
            self.advance();
            Ok(())
        } else {
            Err(format!("{}: found {:?}", err, self.peek()))
        }
    }

    fn is_at_end(&self) -> bool {
        self.pos >= self.tokens.len() || self.peek() == &Token::Eof
    }
}
