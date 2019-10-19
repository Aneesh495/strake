//! Fast Fourier Transform (FFT) and Inverse FFT (IFFT) routines.
//!
//! Implements Radix-2 Cooley-Tukey decimation-in-time algorithm with bit-reversal
//! permutation, supporting forward and inverse complex transforms across 1D vectors
//! and multi-channel 2D matrices.

use std::f64::consts::PI;
use num_complex::Complex64;
use crate::tensor::Tensor;

/// In-place radix-2 Cooley-Tukey FFT.
/// If `inverse` is true, performs IFFT with 1/N scaling.
pub fn fft_1d_inplace(buffer: &mut [Complex64], inverse: bool) {
    let n = buffer.len();
    if n <= 1 {
        return;
    }
    assert!(n.is_power_of_two(), "FFT length must be a power of two: {}", n);

    // Bit-reversal permutation
    let mut j = 0;
    for i in 0..n {
        if i < j {
            buffer.swap(i, j);
        }
        let mut bit = n >> 1;
        while j & bit != 0 {
            j ^= bit;
            bit >>= 1;
        }
        j ^= bit;
    }

    // Butterfly computations
    let sign = if inverse { 1.0 } else { -1.0 };
    let mut len = 2;
    while len <= n {
        let half = len / 2;
        let angle = sign * 2.0 * PI / (len as f64);
        let w_step = Complex64::from_polar(1.0, angle);

        for i in (0..n).step_by(len) {
            let mut w = Complex64::new(1.0, 0.0);
            for k in 0..half {
                let u = buffer[i + k];
                let v = buffer[i + k + half] * w;
                buffer[i + k] = u + v;
                buffer[i + k + half] = u - v;
                w *= w_step;
            }
        }
        len <<= 1;
    }

    // Scale by 1/N for inverse FFT
    if inverse {
        let scale = 1.0 / (n as f64);
        for x in buffer.iter_mut() {
            *x *= scale;
        }
    }
}

/// Compute 1D FFT of a slice, padding to the next power of two if needed.
pub fn fft_1d(input: &[Complex64]) -> Vec<Complex64> {
    let n = input.len().next_power_of_two();
    let mut buffer = vec![Complex64::new(0.0, 0.0); n];
    buffer[..input.len()].copy_from_slice(input);
    fft_1d_inplace(&mut buffer, false);
    buffer
}

/// Compute 1D IFFT of a slice.
pub fn ifft_1d(input: &[Complex64]) -> Vec<Complex64> {
    let n = input.len();
    assert!(n.is_power_of_two(), "IFFT input length must be power of two");
    let mut buffer = input.to_vec();
    fft_1d_inplace(&mut buffer, true);
    buffer
}

/// Compute FFT along the last axis of a 2D tensor (channels x samples).
pub fn fft_rows(tensor: &Tensor) -> Tensor {
    assert_eq!(tensor.rank(), 2, "fft_rows expects 2D tensor (rows x cols)");
    let c = tensor.to_complex();
    let slice = c.as_slice_complex().unwrap();
    let rows = tensor.shape[0];
    let cols = tensor.shape[1];

    let n_fft = cols.next_power_of_two();
    let mut out_data = Vec::with_capacity(rows * n_fft);

    for r in 0..rows {
        let row_slice = &slice[r * cols..(r + 1) * cols];
        let row_fft = fft_1d(row_slice);
        out_data.extend_from_slice(&row_fft);
    }

    Tensor {
        shape: vec![rows, n_fft],
        strides: vec![n_fft, 1],
        data: crate::tensor::TensorData::Complex(out_data),
    }
}
