//! APL Lexer and token definitions.
//!
//! Recognizes standard Unicode APL glyphs, ASCII aliases, numeric literals,
//! string literals, identifiers, and control delimiters.

#[derive(Debug, Clone, PartialEq)]
pub enum Token {
    Number(f64),
    Complex(f64, f64),
    StringLit(String),
    Identifier(String),

    // Arithmetic Primitives
    Plus,          // +
    Minus,         // -
    Times,         // × or *
    Divide,        // ÷ or /
    Power,         // *
    Logarithm,     // ⍟
    Ceiling,       // ⌈
    Floor,         // ⌊
    Magnitude,     // |
    Factorial,     // !
    Roll,          // ?

    // Structural Primitives
    Rho,           // ⍴
    Iota,          // ⍳
    Reverse,       // ⌽
    ReverseFirst,  // ⊖
    Transpose,     // ⍉
    Take,          // ↑
    Drop,          // ↓
    Membership,    // ∊
    Find,          // ⍷
    Enclose,       // ⊂
    Disclose,      // ⊃
    Partition,     // ⊆
    Index,         // ⌷

    // Operators & Adverbs
    Reduce,        // /
    Scan,          // \
    Each,          // ¨
    Commute,       // ⍨
    OuterProduct,  // ∘.
    InnerProduct,  // .
    Rank,          // ⍤

    // Syntax & Variables
    Assign,        // ← or =
    Alpha,         // ⍺ (left arg)
    Omega,         // ⍵ (right arg)
    DfnOpen,       // {
    DfnClose,      // }
    LParen,        // (
    RParen,        // )
    LBracket,      // [
    RBracket,      // ]
    Separator,     // ⋄ or newline
    Eof,
}

pub struct Lexer<'a> {
    _input: &'a str,
    chars: Vec<char>,
    pos: usize,
}

impl<'a> Lexer<'a> {
    pub fn new(input: &'a str) -> Self {
        Self {
            _input: input,
            chars: input.chars().collect(),
            pos: 0,
        }
    }

    pub fn tokenize(&mut self) -> Result<Vec<Token>, String> {
        let mut tokens = Vec::new();

        while self.pos < self.chars.len() {
            let ch = self.chars[self.pos];

            // Skip whitespace (spaces and tabs, but handle newlines as separators)
            if ch == ' ' || ch == '\t' || ch == '\r' {
                self.pos += 1;
                continue;
            }

            // Newlines and diamond separators
            if ch == '\n' || ch == '⋄' {
                tokens.push(Token::Separator);
                self.pos += 1;
                continue;
            }

            // Comments: ⍝ or # or //
            if ch == '⍝' || ch == '#' || (ch == '/' && self.peek() == Some('/')) {
                while self.pos < self.chars.len() && self.chars[self.pos] != '\n' {
                    self.pos += 1;
                }
                continue;
            }

            // Numbers: negative sign in APL is ¯ or standard - before digit
            if ch.is_ascii_digit() || ch == '¯' || (ch == '-' && self.peek().map_or(false, |c| c.is_ascii_digit() || c == '.')) {
                tokens.push(self.read_number()?);
                continue;
            }

            // Strings
            if ch == '\'' || ch == '"' {
                tokens.push(self.read_string(ch)?);
                continue;
            }

            // Identifiers / ASCII keywords
            if ch.is_alphabetic() || ch == '_' {
                tokens.push(self.read_identifier());
                continue;
            }

            // Outer product ∘.
            if ch == '∘' && self.peek() == Some('.') {
                self.pos += 2;
                tokens.push(Token::OuterProduct);
                continue;
            }

            // Glyphs
            let token = match ch {
                '+' => Token::Plus,
                '-' => Token::Minus,
                '×' => Token::Times,
                '÷' => Token::Divide,
                '*' => Token::Power,
                '⍟' => Token::Logarithm,
                '⌈' => Token::Ceiling,
                '⌊' => Token::Floor,
                '|' => Token::Magnitude,
                '!' => Token::Factorial,
                '?' => Token::Roll,

                '⍴' => Token::Rho,
                '⍳' => Token::Iota,
                '⌽' => Token::Reverse,
                '⊖' => Token::ReverseFirst,
                '⍉' => Token::Transpose,
                '↑' => Token::Take,
                '↓' => Token::Drop,
                '∊' => Token::Membership,
                '⍷' => Token::Find,
                '⊂' => Token::Enclose,
                '⊃' => Token::Disclose,
                '⊆' => Token::Partition,
                '⌷' => Token::Index,

                '/' => Token::Reduce,
                '\\' => Token::Scan,
                '¨' => Token::Each,
                '⍨' => Token::Commute,
                '.' => Token::InnerProduct,
                '⍤' => Token::Rank,

                '←' => Token::Assign,
                '=' => Token::Assign, // Pragmatic assignment alias
                '⍺' => Token::Alpha,
                '⍵' => Token::Omega,
                '{' => Token::DfnOpen,
                '}' => Token::DfnClose,
                '(' => Token::LParen,
                ')' => Token::RParen,
                '[' => Token::LBracket,
                ']' => Token::RBracket,

                _ => return Err(format!("Unrecognized character: '{}' at position {}", ch, self.pos)),
            };

            tokens.push(token);
            self.pos += 1;
        }

        tokens.push(Token::Eof);
        Ok(tokens)
    }

    fn peek(&self) -> Option<char> {
        if self.pos + 1 < self.chars.len() {
            Some(self.chars[self.pos + 1])
        } else {
            None
        }
    }

    fn read_number(&mut self) -> Result<Token, String> {
        let mut num_str = String::new();

        if self.chars[self.pos] == '¯' {
            num_str.push('-');
            self.pos += 1;
        } else if self.chars[self.pos] == '-' {
            num_str.push('-');
            self.pos += 1;
        }

        while self.pos < self.chars.len() && (self.chars[self.pos].is_ascii_digit() || self.chars[self.pos] == '.' || self.chars[self.pos] == 'e' || self.chars[self.pos] == 'E') {
            num_str.push(self.chars[self.pos]);
            self.pos += 1;
        }

        // Check for complex notation: 3J4 or 3j4
        if self.pos < self.chars.len() && (self.chars[self.pos] == 'J' || self.chars[self.pos] == 'j') {
            self.pos += 1;
            let mut im_str = String::new();
            if self.pos < self.chars.len() && (self.chars[self.pos] == '¯' || self.chars[self.pos] == '-') {
                im_str.push('-');
                self.pos += 1;
            }
            while self.pos < self.chars.len() && (self.chars[self.pos].is_ascii_digit() || self.chars[self.pos] == '.') {
                im_str.push(self.chars[self.pos]);
                self.pos += 1;
            }
            let re: f64 = num_str.parse().map_err(|e| format!("Invalid real part '{num_str}': {e}"))?;
            let im: f64 = im_str.parse().map_err(|e| format!("Invalid imaginary part '{im_str}': {e}"))?;
            return Ok(Token::Complex(re, im));
        }

        let val: f64 = num_str.parse().map_err(|e| format!("Invalid number '{num_str}': {e}"))?;
        Ok(Token::Number(val))
    }

    fn read_string(&mut self, quote: char) -> Result<Token, String> {
        self.pos += 1; // Skip opening quote
        let mut s = String::new();

        while self.pos < self.chars.len() && self.chars[self.pos] != quote {
            s.push(self.chars[self.pos]);
            self.pos += 1;
        }

        if self.pos >= self.chars.len() {
            return Err("Unterminated string literal".to_string());
        }

        self.pos += 1; // Skip closing quote
        Ok(Token::StringLit(s))
    }

    fn read_identifier(&mut self) -> Token {
        let mut id = String::new();
        while self.pos < self.chars.len() && (self.chars[self.pos].is_alphanumeric() || self.chars[self.pos] == '_') {
            id.push(self.chars[self.pos]);
            self.pos += 1;
        }

        // Match ASCII aliases
        match id.as_str() {
            "rho" => Token::Rho,
            "iota" => Token::Iota,
            "rev" => Token::Reverse,
            "trans" => Token::Transpose,
            "take" => Token::Take,
            "drop" => Token::Drop,
            "abs" => Token::Magnitude,
            "alpha" => Token::Alpha,
            "omega" => Token::Omega,
            _ => Token::Identifier(id),
        }
    }
}
