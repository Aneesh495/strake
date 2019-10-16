//! APL Subsystem: Lexer, Parser, AST, Environment, and Evaluator.

pub mod token;
pub mod ast;
pub mod parser;
pub mod env;
pub mod evaluator;

pub use token::{Token, Lexer};
pub use ast::{Expr, Primitive, Operator, Program};
pub use env::{Env, Value};
pub use evaluator::Evaluator;

use crate::tensor::Tensor;

/// Helper to tokenize, parse, and evaluate an APL code string.
pub fn eval_apl(code: &str) -> Result<Tensor, String> {
    let mut lexer = Lexer::new(code);
    let tokens = lexer.tokenize()?;
    let mut parser = parser::Parser::new(tokens);
    let program = parser.parse_program()?;
    let mut evaluator = Evaluator::new();
    evaluator.eval_program(&program)
}
