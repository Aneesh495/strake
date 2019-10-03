//! Abstract Syntax Tree (AST) definitions for APL expressions and programs.

use crate::tensor::Tensor;

#[derive(Debug, Clone, PartialEq)]
pub enum Primitive {
    Plus,
    Minus,
    Times,
    Divide,
    Power,
    Logarithm,
    Ceiling,
    Floor,
    Magnitude,
    Factorial,
    Roll,

    Rho,
    Iota,
    Reverse,
    Transpose,
    Take,
    Drop,
    Membership,
    Find,
    Enclose,
    Disclose,
}

#[derive(Debug, Clone, PartialEq)]
pub enum Operator {
    Reduce,       // /
    Scan,         // \
    Each,         // ¨
    Commute,      // ⍨
    OuterProduct, // ∘.
    InnerProduct, // .
    Rank,         // ⍤
}

#[derive(Debug, Clone, PartialEq)]
pub enum Expr {
    /// Literal tensor value (scalar, vector, matrix)
    Constant(Tensor),

    /// Variable or function identifier
    Variable(String),

    /// Alpha (left argument inside dfn)
    Alpha,

    /// Omega (right argument inside dfn)
    Omega,

    /// Monadic function application: f ⍵
    Monadic {
        func: Box<Expr>,
        arg: Box<Expr>,
    },

    /// Dyadic function application: ⍺ f ⍵
    Dyadic {
        left: Box<Expr>,
        func: Box<Expr>,
        right: Box<Expr>,
    },

    /// Derived function with adverb/operator: e.g. +/, +\, ∘.×
    OperatorDerived {
        op: Operator,
        func: Box<Expr>,
        arg_func: Option<Box<Expr>>, // For dyadic operators like inner product f.g
    },

    /// Primitive function glyph
    Prim(Primitive),

    /// Assignment: name ← expr
    Assign {
        name: String,
        val: Box<Expr>,
    },

    /// Dynamic function (dfn): { ⍺ + ⍵ }
    Dfn {
        body: Vec<Expr>,
    },

    /// Array vector literal created by whitespace juxtaposition: e.g. 1 2 3 4
    VectorLiteral(Vec<Expr>),

    /// Fork train (f g h) ⍵ -> (f ⍵) g (h ⍵)
    TrainFork {
        f: Box<Expr>,
        g: Box<Expr>,
        h: Box<Expr>,
    },

    /// Atop train (f g) ⍵ -> f (g ⍵)
    TrainAtop {
        f: Box<Expr>,
        g: Box<Expr>,
    },
}

#[derive(Debug, Clone, PartialEq)]
pub struct Program {
    pub statements: Vec<Expr>,
}
