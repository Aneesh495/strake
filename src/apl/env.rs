//! APL symbol table and workspace environment.

use std::collections::HashMap;
use crate::tensor::Tensor;
use crate::apl::ast::Expr;

#[derive(Debug, Clone)]
pub enum Value {
    Array(Tensor),
    Function(Expr),
}

#[derive(Debug, Clone)]
pub struct Env {
    vars: HashMap<String, Value>,
    parent: Option<Box<Env>>,
}

impl Env {
    pub fn new() -> Self {
        let mut env = Self {
            vars: HashMap::new(),
            parent: None,
        };
        env.init_prelude();
        env
    }

    pub fn with_parent(parent: Env) -> Self {
        Self {
            vars: HashMap::new(),
            parent: Some(Box::new(parent)),
        }
    }

    fn init_prelude(&mut self) {
        // Physical and acoustic constants
        self.set("C", Value::Array(Tensor::scalar_float(1540.0))); // Speed of sound in tissue (m/s)
        self.set("PI", Value::Array(Tensor::scalar_float(std::f64::consts::PI)));
        self.set("RHO_TISSUE", Value::Array(Tensor::scalar_float(1060.0))); // Tissue density kg/m^3
    }

    pub fn get(&self, name: &str) -> Option<Value> {
        if let Some(val) = self.vars.get(name) {
            Some(val.clone())
        } else if let Some(ref parent) = self.parent {
            parent.get(name)
        } else {
            None
        }
    }

    pub fn set(&mut self, name: &str, val: Value) {
        self.vars.insert(name.to_string(), val);
    }
}
