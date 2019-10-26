//! Digital filtering, window functions, and time-gain compensation (TGC).

use std::f64::consts::PI;
use crate::tensor::{Tensor, TensorData};

/// Generate Hanning window of length n.
pub fn hanning_window(n: usize) -> Vec<f64> {
    if n == 0 { return vec![]; }
    if n == 1 { return vec![1.0]; }
    (0..n)
        .map(|i| 0.5 * (1.0 - (2.0 * PI * (i as f64) / ((n - 1) as f64)).cos()))
        .collect()
}

/// Generate Hamming window of length n.
pub fn hamming_window(n: usize) -> Vec<f64> {
    if n == 0 { return vec![]; }
    if n == 1 { return vec![1.0]; }
    (0..n)
        .map(|i| 0.54 - 0.46 * (2.0 * PI * (i as f64) / ((n - 1) as f64)).cos())
        .collect()
}

/// Generate Tukey window (tapered cosine) of length n with alpha taper parameter.
pub fn tukey_window(n: usize, alpha: f64) -> Vec<f64> {
    if n == 0 { return vec![]; }
    if n == 1 { return vec![1.0]; }
    let mut w = vec![1.0; n];
    let edge = ((alpha * (n - 1) as f64) / 2.0).round() as usize;

    for i in 0..edge {
        let val = 0.5 * (1.0 + (PI * ((2.0 * i as f64) / (alpha * (n - 1) as f64) - 1.0)).cos());
        w[i] = val;
        w[n - 1 - i] = val;
    }
    w
}

/// Convolve 1D signal with 1D kernel (same length output).
pub fn convolve_1d(signal: &[f64], kernel: &[f64]) -> Vec<f64> {
    let s_len = signal.len();
    let k_len = kernel.len();
    if s_len == 0 || k_len == 0 {
        return vec![];
    }
    let half_k = k_len / 2;
    let mut out = vec![0.0; s_len];

    for i in 0..s_len {
        let mut sum = 0.0;
        for j in 0..k_len {
            let s_idx = (i + j) as isize - half_k as isize;
            if s_idx >= 0 && (s_idx as usize) < s_len {
                sum += signal[s_idx as usize] * kernel[k_len - 1 - j];
            }
        }
        out[i] = sum;
    }
    out
}

/// Generate exponential Time-Gain Compensation (TGC) curve.
/// Attenuation compensation: gain(t) = exp(alpha * c * t * 0.5 * 100 * 0.1151).
/// where alpha is attenuation in dB/(MHz*cm), f0 is center freq in MHz, c is sound speed.
pub fn generate_tgc_curve(num_samples: usize, fs: f64, c: f64, alpha_db: f64, f0: f64) -> Tensor {
    let dt = 1.0 / fs;
    let mut curve = Vec::with_capacity(num_samples);
    // Attenuation coefficient in Np/m: alpha_Np = alpha_db * f0 * 100.0 * 0.1151
    let alpha_np = alpha_db * (f0 / 1e6) * 100.0 * 0.115129;

    for i in 0..num_samples {
        let t = (i as f64) * dt;
        let depth = c * t * 0.5; // two-way path
        let gain = (2.0 * alpha_np * depth).exp();
        curve.push(gain);
    }

    Tensor {
        shape: vec![num_samples],
        strides: vec![1],
        data: TensorData::Float(curve),
    }
}
