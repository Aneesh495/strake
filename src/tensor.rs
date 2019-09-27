//! Multidimensional dense tensor core for array-native computation.
//!
//! Provides strided N-dimensional tensors with broadcasting, element-wise
//! operations, contractions, reductions, scans, and structural transformations.

use std::fmt;
use num_complex::Complex64;

#[derive(Debug, Clone, PartialEq)]
pub enum TensorData {
    Float(Vec<f64>),
    Complex(Vec<Complex64>),
    Int(Vec<i64>),
}

#[derive(Debug, Clone, PartialEq)]
pub struct Tensor {
    pub shape: Vec<usize>,
    pub strides: Vec<usize>,
    pub data: TensorData,
}

impl Tensor {
    /// Compute default row-major contiguous strides from shape.
    pub fn compute_strides(shape: &[usize]) -> Vec<usize> {
        if shape.is_empty() {
            return vec![];
        }
        let mut strides = vec![1; shape.len()];
        for i in (0..shape.len() - 1).rev() {
            strides[i] = strides[i + 1] * shape[i + 1];
        }
        strides
    }

    /// Total number of elements in the tensor.
    pub fn numel(&self) -> usize {
        self.shape.iter().product()
    }

    /// Number of dimensions (rank).
    pub fn rank(&self) -> usize {
        self.shape.len()
    }

    /// Create a scalar float tensor.
    pub fn scalar_float(val: f64) -> Self {
        Tensor {
            shape: vec![],
            strides: vec![],
            data: TensorData::Float(vec![val]),
        }
    }

    /// Create a scalar integer tensor.
    pub fn scalar_int(val: i64) -> Self {
        Tensor {
            shape: vec![],
            strides: vec![],
            data: TensorData::Int(vec![val]),
        }
    }

    /// Create a scalar complex tensor.
    pub fn scalar_complex(val: Complex64) -> Self {
        Tensor {
            shape: vec![],
            strides: vec![],
            data: TensorData::Complex(vec![val]),
        }
    }

    /// Create a 1D tensor from float vector.
    pub fn vector_float(vals: Vec<f64>) -> Self {
        let n = vals.len();
        Tensor {
            shape: vec![n],
            strides: vec![1],
            data: TensorData::Float(vals),
        }
    }

    /// Create a 1D tensor from integer vector.
    pub fn vector_int(vals: Vec<i64>) -> Self {
        let n = vals.len();
        Tensor {
            shape: vec![n],
            strides: vec![1],
            data: TensorData::Int(vals),
        }
    }

    /// Create a 1D tensor from complex vector.
    pub fn vector_complex(vals: Vec<Complex64>) -> Self {
        let n = vals.len();
        Tensor {
            shape: vec![n],
            strides: vec![1],
            data: TensorData::Complex(vals),
        }
    }

    /// Create a tensor of zeros of given shape.
    pub fn zeros(shape: Vec<usize>) -> Self {
        let n = shape.iter().product::<usize>().max(1);
        let strides = Self::compute_strides(&shape);
        Tensor {
            shape,
            strides,
            data: TensorData::Float(vec![0.0; n]),
        }
    }

    /// Create a tensor of ones of given shape.
    pub fn ones(shape: Vec<usize>) -> Self {
        let n = shape.iter().product::<usize>().max(1);
        let strides = Self::compute_strides(&shape);
        Tensor {
            shape,
            strides,
            data: TensorData::Float(vec![1.0; n]),
        }
    }

    /// Generate an index vector: iota(n) produces [0, 1, ..., n-1] (0-indexed).
    pub fn iota(n: usize) -> Self {
        let data: Vec<f64> = (0..n).map(|i| i as f64).collect();
        Tensor {
            shape: vec![n],
            strides: vec![1],
            data: TensorData::Float(data),
        }
    }

    /// Generate 1-indexed iota (APL index-origin 1).
    pub fn iota_1(n: usize) -> Self {
        let data: Vec<f64> = (1..=n).map(|i| i as f64).collect();
        Tensor {
            shape: vec![n],
            strides: vec![1],
            data: TensorData::Float(data),
        }
    }

    /// Linearly spaced vector between start and end with count points.
    pub fn linspace(start: f64, end: f64, count: usize) -> Self {
        if count <= 1 {
            return Tensor::vector_float(vec![start]);
        }
        let step = (end - start) / ((count - 1) as f64);
        let data: Vec<f64> = (0..count).map(|i| start + (i as f64) * step).collect();
        Tensor::vector_float(data)
    }

    /// Reshape tensor to a new shape, repeating or truncating data cyclically (APL rho semantics).
    pub fn reshape(&self, new_shape: Vec<usize>) -> Self {
        let new_numel: usize = if new_shape.is_empty() {
            1
        } else {
            new_shape.iter().product()
        };
        let strides = Self::compute_strides(&new_shape);

        match &self.data {
            TensorData::Float(src) => {
                let mut out = Vec::with_capacity(new_numel);
                if src.is_empty() {
                    out.resize(new_numel, 0.0);
                } else {
                    for i in 0..new_numel {
                        out.push(src[i % src.len()]);
                    }
                }
                Tensor {
                    shape: new_shape,
                    strides,
                    data: TensorData::Float(out),
                }
            }
            TensorData::Int(src) => {
                let mut out = Vec::with_capacity(new_numel);
                if src.is_empty() {
                    out.resize(new_numel, 0);
                } else {
                    for i in 0..new_numel {
                        out.push(src[i % src.len()]);
                    }
                }
                Tensor {
                    shape: new_shape,
                    strides,
                    data: TensorData::Int(out),
                }
            }
            TensorData::Complex(src) => {
                let mut out = Vec::with_capacity(new_numel);
                if src.is_empty() {
                    out.resize(new_numel, Complex64::new(0.0, 0.0));
                } else {
                    for i in 0..new_numel {
                        out.push(src[i % src.len()]);
                    }
                }
                Tensor {
                    shape: new_shape,
                    strides,
                    data: TensorData::Complex(out),
                }
            }
        }
    }

    /// Ensure internal data is represented as f64 floats.
    pub fn to_float(&self) -> Tensor {
        match &self.data {
            TensorData::Float(_) => self.clone(),
            TensorData::Int(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Float(v.iter().map(|&x| x as f64).collect()),
            },
            TensorData::Complex(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Float(v.iter().map(|c| c.re).collect()),
            },
        }
    }

    /// Ensure internal data is represented as Complex64.
    pub fn to_complex(&self) -> Tensor {
        match &self.data {
            TensorData::Complex(_) => self.clone(),
            TensorData::Float(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Complex(v.iter().map(|&x| Complex64::new(x, 0.0)).collect()),
            },
            TensorData::Int(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Complex(v.iter().map(|&x| Complex64::new(x as f64, 0.0)).collect()),
            },
        }
    }

    /// Access float slice safely.
    pub fn as_slice_f64(&self) -> Option<&[f64]> {
        match &self.data {
            TensorData::Float(v) => Some(v.as_slice()),
            _ => None,
        }
    }

    /// Access complex slice safely.
    pub fn as_slice_complex(&self) -> Option<&[Complex64]> {
        match &self.data {
            TensorData::Complex(v) => Some(v.as_slice()),
            _ => None,
        }
    }

    /// Transpose dimensions (dyadic or monadic). Monadic reverses axes.
    pub fn transpose(&self) -> Self {
        if self.rank() <= 1 {
            return self.clone();
        }
        let n = self.rank();
        let mut new_shape = self.shape.clone();
        new_shape.reverse();

        let old_strides = &self.strides;
        let mut new_strides = old_strides.clone();
        new_strides.reverse();

        // Materialize contiguous layout
        let numel = self.numel();
        let mut out_data = match &self.data {
            TensorData::Float(_) => TensorData::Float(vec![0.0; numel]),
            TensorData::Int(_) => TensorData::Int(vec![0; numel]),
            TensorData::Complex(_) => TensorData::Complex(vec![Complex64::new(0.0, 0.0); numel]),
        };

        let target_strides = Self::compute_strides(&new_shape);

        // Iteration over source coordinates
        let mut coords = vec![0usize; n];
        for src_idx in 0..numel {
            // Compute destination index
            let mut dst_idx = 0;
            for (dim, &c) in coords.iter().enumerate() {
                let target_dim = n - 1 - dim;
                dst_idx += c * target_strides[target_dim];
            }

            match (&self.data, &mut out_data) {
                (TensorData::Float(src), TensorData::Float(dst)) => dst[dst_idx] = src[src_idx],
                (TensorData::Int(src), TensorData::Int(dst)) => dst[dst_idx] = src[src_idx],
                (TensorData::Complex(src), TensorData::Complex(dst)) => dst[dst_idx] = src[src_idx],
                _ => {}
            }

            // Increment coordinates
            for dim in (0..n).rev() {
                coords[dim] += 1;
                if coords[dim] < self.shape[dim] {
                    break;
                }
                coords[dim] = 0;
            }
        }

        Tensor {
            shape: new_shape,
            strides: target_strides,
            data: out_data,
        }
    }

    /// Element-wise addition.
    pub fn add(&self, rhs: &Tensor) -> Tensor {
        self.elementwise_binary(rhs, |a, b| a + b, |a, b| a + b)
    }

    /// Element-wise subtraction.
    pub fn sub(&self, rhs: &Tensor) -> Tensor {
        self.elementwise_binary(rhs, |a, b| a - b, |a, b| a - b)
    }

    /// Element-wise multiplication.
    pub fn mul(&self, rhs: &Tensor) -> Tensor {
        self.elementwise_binary(rhs, |a, b| a * b, |a, b| a * b)
    }

    /// Element-wise division.
    pub fn div(&self, rhs: &Tensor) -> Tensor {
        self.elementwise_binary(
            rhs,
            |a, b| if b == 0.0 { 0.0 } else { a / b },
            |a, b| if b == Complex64::new(0.0, 0.0) { Complex64::new(0.0, 0.0) } else { a / b },
        )
    }

    /// Element-wise power.
    pub fn pow(&self, rhs: &Tensor) -> Tensor {
        self.elementwise_binary(
            rhs,
            |a, b| a.powf(b),
            |a, b| a.powc(b),
        )
    }

    /// Element-wise maximum (ceiling `⌈`).
    pub fn max(&self, rhs: &Tensor) -> Tensor {
        self.elementwise_binary(
            rhs,
            |a, b| a.max(b),
            |a, b| if a.norm() >= b.norm() { a } else { b },
        )
    }

    /// Element-wise minimum (floor `⌊`).
    pub fn min(&self, rhs: &Tensor) -> Tensor {
        self.elementwise_binary(
            rhs,
            |a, b| a.min(b),
            |a, b| if a.norm() <= b.norm() { a } else { b },
        )
    }

    /// Generic element-wise binary helper supporting scalar broadcasting.
    fn elementwise_binary<FF, FC>(&self, rhs: &Tensor, float_op: FF, comp_op: FC) -> Tensor
    where
        FF: Fn(f64, f64) -> f64,
        FC: Fn(Complex64, Complex64) -> Complex64,
    {
        let is_self_scalar = self.numel() == 1;
        let is_rhs_scalar = rhs.numel() == 1;

        let out_shape = if is_self_scalar {
            rhs.shape.clone()
        } else if is_rhs_scalar {
            self.shape.clone()
        } else {
            // Shapes must match or broadcast
            assert_eq!(self.shape, rhs.shape, "Tensor shape mismatch: {:?} vs {:?}", self.shape, rhs.shape);
            self.shape.clone()
        };

        let numel = if out_shape.is_empty() { 1 } else { out_shape.iter().product() };
        let out_strides = Self::compute_strides(&out_shape);

        // Check if complex
        let has_complex = matches!(self.data, TensorData::Complex(_)) || matches!(rhs.data, TensorData::Complex(_));

        if has_complex {
            let lhs_c = self.to_complex();
            let rhs_c = rhs.to_complex();
            let lhs_slice = lhs_c.as_slice_complex().unwrap();
            let rhs_slice = rhs_c.as_slice_complex().unwrap();

            let mut out = Vec::with_capacity(numel);
            for i in 0..numel {
                let a = if is_self_scalar { lhs_slice[0] } else { lhs_slice[i] };
                let b = if is_rhs_scalar { rhs_slice[0] } else { rhs_slice[i] };
                out.push(comp_op(a, b));
            }
            Tensor {
                shape: out_shape,
                strides: out_strides,
                data: TensorData::Complex(out),
            }
        } else {
            let lhs_f = self.to_float();
            let rhs_f = rhs.to_float();
            let lhs_slice = lhs_f.as_slice_f64().unwrap();
            let rhs_slice = rhs_f.as_slice_f64().unwrap();

            let mut out = Vec::with_capacity(numel);
            for i in 0..numel {
                let a = if is_self_scalar { lhs_slice[0] } else { lhs_slice[i] };
                let b = if is_rhs_scalar { rhs_slice[0] } else { rhs_slice[i] };
                out.push(float_op(a, b));
            }
            Tensor {
                shape: out_shape,
                strides: out_strides,
                data: TensorData::Float(out),
            }
        }
    }

    /// Monadic magnitude / absolute value `|`.
    pub fn abs(&self) -> Tensor {
        match &self.data {
            TensorData::Float(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Float(v.iter().map(|&x| x.abs()).collect()),
            },
            TensorData::Int(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Int(v.iter().map(|&x| x.abs()).collect()),
            },
            TensorData::Complex(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Float(v.iter().map(|c| c.norm()).collect()),
            },
        }
    }

    /// Monadic negative `-`.
    pub fn negate(&self) -> Tensor {
        match &self.data {
            TensorData::Float(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Float(v.iter().map(|&x| -x).collect()),
            },
            TensorData::Int(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Int(v.iter().map(|&x| -x).collect()),
            },
            TensorData::Complex(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Complex(v.iter().map(|c| -c).collect()),
            },
        }
    }

    /// Monadic reciprocal `÷`.
    pub fn reciprocal(&self) -> Tensor {
        match &self.data {
            TensorData::Float(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Float(v.iter().map(|&x| if x == 0.0 { 0.0 } else { 1.0 / x }).collect()),
            },
            TensorData::Int(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Float(v.iter().map(|&x| if x == 0 { 0.0 } else { 1.0 / (x as f64) }).collect()),
            },
            TensorData::Complex(v) => Tensor {
                shape: self.shape.clone(),
                strides: self.strides.clone(),
                data: TensorData::Complex(v.iter().map(|c| if *c == Complex64::new(0.0, 0.0) { *c } else { c.inv() }).collect()),
            },
        }
    }

    /// Monadic exponential `*` e^x.
    pub fn exp(&self) -> Tensor {
        let f = self.to_float();
        let s = f.as_slice_f64().unwrap();
        Tensor {
            shape: self.shape.clone(),
            strides: self.strides.clone(),
            data: TensorData::Float(s.iter().map(|&x| x.exp()).collect()),
        }
    }

    /// Monadic natural log `⍟` ln(x).
    pub fn ln(&self) -> Tensor {
        let f = self.to_float();
        let s = f.as_slice_f64().unwrap();
        Tensor {
            shape: self.shape.clone(),
            strides: self.strides.clone(),
            data: TensorData::Float(s.iter().map(|&x| if x <= 0.0 { 0.0 } else { x.ln() }).collect()),
        }
    }

    /// Log base 10 for decibel calculations.
    pub fn log10(&self) -> Tensor {
        let f = self.to_float();
        let s = f.as_slice_f64().unwrap();
        Tensor {
            shape: self.shape.clone(),
            strides: self.strides.clone(),
            data: TensorData::Float(s.iter().map(|&x| if x <= 0.0 { 0.0 } else { x.log10() }).collect()),
        }
    }

    /// Monadic square root.
    pub fn sqrt(&self) -> Tensor {
        let f = self.to_float();
        let s = f.as_slice_f64().unwrap();
        Tensor {
            shape: self.shape.clone(),
            strides: self.strides.clone(),
            data: TensorData::Float(s.iter().map(|&x| if x < 0.0 { 0.0 } else { x.sqrt() }).collect()),
        }
    }

    /// Monadic sine.
    pub fn sin(&self) -> Tensor {
        let f = self.to_float();
        let s = f.as_slice_f64().unwrap();
        Tensor {
            shape: self.shape.clone(),
            strides: self.strides.clone(),
            data: TensorData::Float(s.iter().map(|&x| x.sin()).collect()),
        }
    }

    /// Monadic cosine.
    pub fn cos(&self) -> Tensor {
        let f = self.to_float();
        let s = f.as_slice_f64().unwrap();
        Tensor {
            shape: self.shape.clone(),
            strides: self.strides.clone(),
            data: TensorData::Float(s.iter().map(|&x| x.cos()).collect()),
        }
    }

    /// Reduction along the last axis: sum (+/).
    pub fn sum_reduce(&self) -> Tensor {
        self.reduce_last_axis(|a, b| a + b, 0.0)
    }

    /// Reduction along the last axis: product (×/).
    pub fn prod_reduce(&self) -> Tensor {
        self.reduce_last_axis(|a, b| a * b, 1.0)
    }

    /// Reduction along the last axis: max (⌈/).
    pub fn max_reduce(&self) -> Tensor {
        self.reduce_last_axis(|a, b| a.max(b), f64::NEG_INFINITY)
    }

    /// Reduction along the last axis: min (⌊/).
    pub fn min_reduce(&self) -> Tensor {
        self.reduce_last_axis(|a, b| a.min(b), f64::INFINITY)
    }

    /// Reduce last dimension helper.
    pub fn reduce_last_axis<F>(&self, op: F, init: f64) -> Tensor
    where
        F: Fn(f64, f64) -> f64,
    {
        if self.shape.is_empty() {
            return self.clone();
        }
        let rank = self.rank();
        let last_dim = self.shape[rank - 1];
        let outer_dims = &self.shape[0..rank - 1];
        let outer_numel: usize = outer_dims.iter().product::<usize>().max(1);

        let f = self.to_float();
        let s = f.as_slice_f64().unwrap();

        let mut out = Vec::with_capacity(outer_numel);
        for i in 0..outer_numel {
            let offset = i * last_dim;
            let mut acc = init;
            for j in 0..last_dim {
                acc = op(acc, s[offset + j]);
            }
            out.push(acc);
        }

        let out_shape = outer_dims.to_vec();
        let out_strides = Self::compute_strides(&out_shape);
        Tensor {
            shape: out_shape,
            strides: out_strides,
            data: TensorData::Float(out),
        }
    }

    /// Prefix scan along the last axis: sum scan (+\).
    pub fn sum_scan(&self) -> Tensor {
        if self.shape.is_empty() {
            return self.clone();
        }
        let rank = self.rank();
        let last_dim = self.shape[rank - 1];
        let outer_dims = &self.shape[0..rank - 1];
        let outer_numel: usize = outer_dims.iter().product::<usize>().max(1);

        let f = self.to_float();
        let s = f.as_slice_f64().unwrap();

        let mut out = Vec::with_capacity(self.numel());
        for i in 0..outer_numel {
            let offset = i * last_dim;
            let mut acc = 0.0;
            for j in 0..last_dim {
                acc += s[offset + j];
                out.push(acc);
            }
        }

        Tensor {
            shape: self.shape.clone(),
            strides: self.strides.clone(),
            data: TensorData::Float(out),
        }
    }

    /// Matrix multiplication / inner product (+.×).
    /// Supports (M, K) x (K, N) -> (M, N).
    pub fn matmul(&self, rhs: &Tensor) -> Result<Tensor, String> {
        let f_lhs = self.to_float();
        let f_rhs = rhs.to_float();

        let lhs_shape = &f_lhs.shape;
        let rhs_shape = &f_rhs.shape;

        if lhs_shape.len() == 2 && rhs_shape.len() == 2 {
            let m = lhs_shape[0];
            let k1 = lhs_shape[1];
            let k2 = rhs_shape[0];
            let n = rhs_shape[1];

            if k1 != k2 {
                return Err(format!("Matrix dimension mismatch in matmul: ({m}, {k1}) x ({k2}, {n})"));
            }

            let a = f_lhs.as_slice_f64().unwrap();
            let b = f_rhs.as_slice_f64().unwrap();
            let mut c = vec![0.0; m * n];

            for i in 0..m {
                let a_row = i * k1;
                let c_row = i * n;
                for p in 0..k1 {
                    let a_val = a[a_row + p];
                    let b_row = p * n;
                    for j in 0..n {
                        c[c_row + j] += a_val * b[b_row + j];
                    }
                }
            }

            Ok(Tensor {
                shape: vec![m, n],
                strides: vec![n, 1],
                data: TensorData::Float(c),
            })
        } else if lhs_shape.len() == 1 && rhs_shape.len() == 1 {
            // Vector dot product
            if lhs_shape[0] != rhs_shape[0] {
                return Err(format!("Vector length mismatch in dot product: {} vs {}", lhs_shape[0], rhs_shape[0]));
            }
            let a = f_lhs.as_slice_f64().unwrap();
            let b = f_rhs.as_slice_f64().unwrap();
            let sum: f64 = a.iter().zip(b.iter()).map(|(x, y)| x * y).sum();
            Ok(Tensor::scalar_float(sum))
        } else {
            Err(format!("Unsupported matmul ranks: {:?} and {:?}", lhs_shape, rhs_shape))
        }
    }

    /// Outer product (∘.f) where f is a binary operation.
    pub fn outer_product<F>(&self, rhs: &Tensor, op: F) -> Tensor
    where
        F: Fn(f64, f64) -> f64,
    {
        let f_lhs = self.to_float();
        let f_rhs = rhs.to_float();
        let a = f_lhs.as_slice_f64().unwrap();
        let b = f_rhs.as_slice_f64().unwrap();

        let mut out_shape = f_lhs.shape.clone();
        out_shape.extend_from_slice(&f_rhs.shape);
        let out_strides = Self::compute_strides(&out_shape);

        let mut out = Vec::with_capacity(a.len() * b.len());
        for &x in a {
            for &y in b {
                out.push(op(x, y));
            }
        }

        Tensor {
            shape: out_shape,
            strides: out_strides,
            data: TensorData::Float(out),
        }
    }
}

impl fmt::Display for Tensor {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "Tensor(shape={:?}) [", self.shape)?;
        match &self.data {
            TensorData::Float(v) => {
                if v.len() <= 8 {
                    for (i, val) in v.iter().enumerate() {
                        if i > 0 { write!(f, " ")?; }
                        write!(f, "{:.4}", val)?;
                    }
                } else {
                    for i in 0..4 {
                        write!(f, "{:.4} ", v[i])?;
                    }
                    write!(f, "... ")?;
                    for i in (v.len() - 3)..v.len() {
                        write!(f, "{:.4}", v[i])?;
                        if i < v.len() - 1 { write!(f, " ")?; }
                    }
                }
            }
            TensorData::Int(v) => {
                if v.len() <= 8 {
                    for (i, val) in v.iter().enumerate() {
                        if i > 0 { write!(f, " ")?; }
                        write!(f, "{}", val)?;
                    }
                } else {
                    for i in 0..4 {
                        write!(f, "{} ", v[i])?;
                    }
                    write!(f, "... ")?;
                    for i in (v.len() - 3)..v.len() {
                        write!(f, "{}", v[i])?;
                        if i < v.len() - 1 { write!(f, " ")?; }
                    }
                }
            }
            TensorData::Complex(v) => {
                if v.len() <= 4 {
                    for (i, val) in v.iter().enumerate() {
                        if i > 0 { write!(f, " ")?; }
                        write!(f, "{:.2}+{:.2}j", val.re, val.im)?;
                    }
                } else {
                    write!(f, "{:.2}+{:.2}j ... len={}", v[0].re, v[0].im, v.len())?;
                }
            }
        }
        write!(f, "]")
    }
}
