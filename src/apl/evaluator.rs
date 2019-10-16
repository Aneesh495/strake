//! APL Evaluator and Runtime.
//!
//! Evaluates AST nodes against a workspace Environment, applying primitives,
//! derived functions, outer products, reductions, and dfns.

use crate::apl::ast::{Expr, Primitive, Operator, Program};
use crate::apl::env::{Env, Value};
use crate::tensor::{Tensor, TensorData};

pub struct Evaluator {
    pub env: Env,
}

impl Evaluator {
    pub fn new() -> Self {
        Self {
            env: Env::new(),
        }
    }

    pub fn eval_program(&mut self, prog: &Program) -> Result<Tensor, String> {
        let mut last_val = Tensor::scalar_float(0.0);
        for stmt in &prog.statements {
            let val = self.eval_expr(stmt)?;
            match val {
                Value::Array(t) => last_val = t,
                Value::Function(_) => {}
            }
        }
        Ok(last_val)
    }

    pub fn eval_expr(&mut self, expr: &Expr) -> Result<Value, String> {
        match expr {
            Expr::Constant(t) => Ok(Value::Array(t.clone())),

            Expr::Variable(name) => {
                if let Some(val) = self.env.get(name) {
                    Ok(val)
                } else {
                    Err(format!("Undefined identifier: '{}'", name))
                }
            }

            Expr::Alpha => {
                if let Some(val) = self.env.get("⍺") {
                    Ok(val)
                } else {
                    Err("Variable '⍺' not defined in current scope".to_string())
                }
            }

            Expr::Omega => {
                if let Some(val) = self.env.get("⍵") {
                    Ok(val)
                } else {
                    Err("Variable '⍵' not defined in current scope".to_string())
                }
            }

            Expr::Prim(_) | Expr::OperatorDerived { .. } | Expr::Dfn { .. } => {
                Ok(Value::Function(expr.clone()))
            }

            Expr::Assign { name, val } => {
                let eval_val = self.eval_expr(val)?;
                self.env.set(name, eval_val.clone());
                Ok(eval_val)
            }

            Expr::VectorLiteral(items) => {
                let mut flat_vals = Vec::new();
                for item in items {
                    match self.eval_expr(item)? {
                        Value::Array(t) => {
                            let f = t.to_float();
                            if let Some(s) = f.as_slice_f64() {
                                flat_vals.extend_from_slice(s);
                            }
                        }
                        Value::Function(_) => return Err("Cannot include function inside vector literal".to_string()),
                    }
                }
                Ok(Value::Array(Tensor::vector_float(flat_vals)))
            }

            Expr::Monadic { func, arg } => {
                let arg_val = self.eval_expr(arg)?;
                let tensor_arg = match arg_val {
                    Value::Array(t) => t,
                    Value::Function(_) => return Err("Monadic argument must be array".to_string()),
                };

                self.apply_monadic(func, &tensor_arg)
            }

            Expr::Dyadic { left, func, right } => {
                let left_val = self.eval_expr(left)?;
                let right_val = self.eval_expr(right)?;

                let left_tensor = match left_val {
                    Value::Array(t) => t,
                    Value::Function(_) => return Err("Left argument must be array".to_string()),
                };
                let right_tensor = match right_val {
                    Value::Array(t) => t,
                    Value::Function(_) => return Err("Right argument must be array".to_string()),
                };

                self.apply_dyadic(&left_tensor, func, &right_tensor)
            }

            Expr::TrainFork { f, g, h } => Ok(Value::Function(Expr::TrainFork {
                f: f.clone(),
                g: g.clone(),
                h: h.clone(),
            })),

            Expr::TrainAtop { f, g } => Ok(Value::Function(Expr::TrainAtop {
                f: f.clone(),
                g: g.clone(),
            })),
        }
    }

    fn apply_monadic(&mut self, func: &Expr, arg: &Tensor) -> Result<Value, String> {
        match func {
            Expr::Prim(prim) => {
                let res = match prim {
                    Primitive::Plus => arg.clone(),
                    Primitive::Minus => arg.negate(),
                    Primitive::Divide => arg.reciprocal(),
                    Primitive::Power => arg.exp(),
                    Primitive::Logarithm => arg.ln(),
                    Primitive::Magnitude => arg.abs(),
                    Primitive::Ceiling => {
                        let f = arg.to_float();
                        let s = f.as_slice_f64().unwrap();
                        Tensor {
                            shape: arg.shape.clone(),
                            strides: arg.strides.clone(),
                            data: TensorData::Float(s.iter().map(|&x| x.ceil()).collect()),
                        }
                    }
                    Primitive::Floor => {
                        let f = arg.to_float();
                        let s = f.as_slice_f64().unwrap();
                        Tensor {
                            shape: arg.shape.clone(),
                            strides: arg.strides.clone(),
                            data: TensorData::Float(s.iter().map(|&x| x.floor()).collect()),
                        }
                    }
                    Primitive::Rho => {
                        // Shape-of (⍴ ⍵)
                        let shape_data: Vec<f64> = arg.shape.iter().map(|&d| d as f64).collect();
                        Tensor::vector_float(shape_data)
                    }
                    Primitive::Iota => {
                        // Index generator (⍳ ⍵)
                        let n = if arg.numel() == 1 {
                            let f = arg.to_float();
                            f.as_slice_f64().unwrap()[0] as usize
                        } else {
                            return Err("Monadic iota requires scalar count".to_string());
                        };
                        Tensor::iota_1(n)
                    }
                    Primitive::Reverse => {
                        let t = arg.clone();
                        let s = t.to_float();
                        let mut vals = s.as_slice_f64().unwrap().to_vec();
                        vals.reverse();
                        Tensor {
                            shape: arg.shape.clone(),
                            strides: arg.strides.clone(),
                            data: TensorData::Float(vals),
                        }
                    }
                    Primitive::Transpose => arg.transpose(),
                    _ => return Err(format!("Unimplemented monadic primitive: {:?}", prim)),
                };
                Ok(Value::Array(res))
            }

            Expr::OperatorDerived { op, func: inner_func, .. } => {
                match op {
                    Operator::Reduce => {
                        if let Expr::Prim(prim) = inner_func.as_ref() {
                            let res = match prim {
                                Primitive::Plus => arg.sum_reduce(),
                                Primitive::Times => arg.prod_reduce(),
                                Primitive::Ceiling => arg.max_reduce(),
                                Primitive::Floor => arg.min_reduce(),
                                _ => return Err(format!("Unsupported reduction primitive: {:?}", prim)),
                            };
                            Ok(Value::Array(res))
                        } else {
                            Err("Operator / requires a primitive function".to_string())
                        }
                    }
                    Operator::Scan => {
                        if let Expr::Prim(prim) = inner_func.as_ref() {
                            let res = match prim {
                                Primitive::Plus => arg.sum_scan(),
                                _ => return Err(format!("Unsupported scan primitive: {:?}", prim)),
                            };
                            Ok(Value::Array(res))
                        } else {
                            Err("Operator \\ requires a primitive function".to_string())
                        }
                    }
                    _ => Err(format!("Unsupported monadic operator: {:?}", op)),
                }
            }

            Expr::Dfn { body } => {
                let mut dfn_env = Env::with_parent(self.env.clone());
                dfn_env.set("⍵", Value::Array(arg.clone()));
                let old_env = std::mem::replace(&mut self.env, dfn_env);

                let mut last_res = Value::Array(Tensor::scalar_float(0.0));
                for stmt in body {
                    last_res = self.eval_expr(stmt)?;
                }

                self.env = old_env;
                Ok(last_res)
            }

            Expr::Variable(name) => {
                match self.env.get(name) {
                    Some(Value::Function(f)) => self.apply_monadic(&f, arg),
                    Some(Value::Array(t)) => {
                        let mut vals = Vec::new();
                        let f_t = t.to_float();
                        let f_arg = arg.to_float();
                        if let Some(s) = f_t.as_slice_f64() { vals.extend_from_slice(s); }
                        if let Some(s) = f_arg.as_slice_f64() { vals.extend_from_slice(s); }
                        Ok(Value::Array(Tensor::vector_float(vals)))
                    }
                    None => Err(format!("Undefined identifier: '{}'", name)),
                }
            }

            _ => Err(format!("Cannot invoke as monadic function: {:?}", func)),
        }
    }

    fn apply_dyadic(&mut self, left: &Tensor, func: &Expr, right: &Tensor) -> Result<Value, String> {
        match func {
            Expr::Prim(prim) => {
                let res = match prim {
                    Primitive::Plus => left.add(right),
                    Primitive::Minus => left.sub(right),
                    Primitive::Times => left.mul(right),
                    Primitive::Divide => left.div(right),
                    Primitive::Power => left.pow(right),
                    Primitive::Ceiling => left.max(right),
                    Primitive::Floor => left.min(right),
                    Primitive::Rho => {
                        // Reshape (⍺ ⍴ ⍵)
                        let left_f = left.to_float();
                        let dims: Vec<usize> = left_f
                            .as_slice_f64()
                            .unwrap()
                            .iter()
                            .map(|&d| d as usize)
                            .collect();
                        right.reshape(dims)
                    }
                    Primitive::Take => {
                        // Take (⍺ ↑ ⍵)
                        let left_f = left.to_float();
                        let count = left_f.as_slice_f64().unwrap()[0] as isize;
                        let right_f = right.to_float();
                        let s = right_f.as_slice_f64().unwrap();
                        let n = s.len();

                        let res_data: Vec<f64> = if count >= 0 {
                            let take_n = (count as usize).min(n);
                            let mut v = s[..take_n].to_vec();
                            if v.len() < count as usize {
                                v.resize(count as usize, 0.0);
                            }
                            v
                        } else {
                            let take_n = ((-count) as usize).min(n);
                            s[n - take_n..].to_vec()
                        };
                        Tensor::vector_float(res_data)
                    }
                    Primitive::Drop => {
                        // Drop (⍺ ↓ ⍵)
                        let left_f = left.to_float();
                        let count = left_f.as_slice_f64().unwrap()[0] as usize;
                        let right_f = right.to_float();
                        let s = right_f.as_slice_f64().unwrap();
                        let res_data = if count >= s.len() {
                            vec![]
                        } else {
                            s[count..].to_vec()
                        };
                        Tensor::vector_float(res_data)
                    }
                    _ => return Err(format!("Unimplemented dyadic primitive: {:?}", prim)),
                };
                Ok(Value::Array(res))
            }

            Expr::OperatorDerived { op, func: inner_func, .. } => {
                match op {
                    Operator::OuterProduct => {
                        if let Expr::Prim(prim) = inner_func.as_ref() {
                            let op_closure: Box<dyn Fn(f64, f64) -> f64> = match prim {
                                Primitive::Times => Box::new(|a, b| a * b),
                                Primitive::Plus => Box::new(|a, b| a + b),
                                Primitive::Minus => Box::new(|a, b| a - b),
                                Primitive::Divide => Box::new(|a, b| if b == 0.0 { 0.0 } else { a / b }),
                                _ => return Err(format!("Unsupported outer product primitive: {:?}", prim)),
                            };
                            let res = left.outer_product(right, op_closure);
                            Ok(Value::Array(res))
                        } else {
                            Err("Outer product requires primitive".to_string())
                        }
                    }
                    _ => Err(format!("Unsupported dyadic operator: {:?}", op)),
                }
            }

            Expr::Dfn { body } => {
                let mut dfn_env = Env::with_parent(self.env.clone());
                dfn_env.set("⍺", Value::Array(left.clone()));
                dfn_env.set("⍵", Value::Array(right.clone()));
                let old_env = std::mem::replace(&mut self.env, dfn_env);

                let mut last_res = Value::Array(Tensor::scalar_float(0.0));
                for stmt in body {
                    last_res = self.eval_expr(stmt)?;
                }

                self.env = old_env;
                Ok(last_res)
            }

            Expr::Variable(name) => {
                match self.env.get(name) {
                    Some(Value::Function(f)) => self.apply_dyadic(left, &f, right),
                    Some(Value::Array(t)) => {
                        let mut vals = Vec::new();
                        let f_l = left.to_float();
                        let f_t = t.to_float();
                        let f_r = right.to_float();
                        if let Some(s) = f_l.as_slice_f64() { vals.extend_from_slice(s); }
                        if let Some(s) = f_t.as_slice_f64() { vals.extend_from_slice(s); }
                        if let Some(s) = f_r.as_slice_f64() { vals.extend_from_slice(s); }
                        Ok(Value::Array(Tensor::vector_float(vals)))
                    }
                    None => Err(format!("Undefined identifier: '{}'", name)),
                }
            }

            _ => Err(format!("Cannot invoke as dyadic function: {:?}", func)),
        }
    }
}
