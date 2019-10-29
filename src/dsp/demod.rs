//! Quadrature demodulation (I/Q) and baseband downconversion.
//!
//! Multiplies real RF signal by complex carrier exp(-j * 2 * pi * f0 * t)
//! followed by low-pass filtering and decimation to extract in-phase (I) and
//! quadrature (Q) baseband components.

use std::f64::consts::PI;
use num_complex::Complex64;
use crate::tensor::{Tensor, TensorData};
use crate::dsp::filter::{convolve_1d, hanning_window};

/// Quadrature downconvert 1D RF signal to complex baseband.
pub fn demodulate_iq_1d(rf: &[f64], f0: f64, fs: f64, decimation: usize) -> Vec<Complex64> {
    let n = rf.len();
    let dt = 1.0 / fs;

    // Mixing with exp(-j * 2 * pi * f0 * t)
    let mut mixed_i = vec![0.0; n];
    let mut mixed_q = vec![0.0; n];

    for i in 0..n {
        let t = (i as f64) * dt;
        let phase = 2.0 * PI * f0 * t;
        let cos_val = phase.cos();
        let sin_val = -phase.sin();

        mixed_i[i] = 2.0 * rf[i] * cos_val;
        mixed_q[i] = 2.0 * rf[i] * sin_val;
    }

    // Low-pass filter (Hanning smoothed sinc)
    let filter_len = 31.min(n / 2);
    let lpf_kernel = hanning_window(filter_len);
    let lpf_sum: f64 = lpf_kernel.iter().sum();
    let norm_kernel: Vec<f64> = lpf_kernel.iter().map(|&x| x / lpf_sum).collect();

    let filtered_i = convolve_1d(&mixed_i, &norm_kernel);
    let filtered_q = convolve_1d(&mixed_q, &norm_kernel);

    // Decimation
    let dec = decimation.max(1);
    let mut baseband = Vec::with_capacity(n / dec);

    for i in (0..n).step_by(dec) {
        baseband.push(Complex64::new(filtered_i[i], filtered_q[i]));
    }

    baseband
}

/// Demodulate all channels in a 2D RF tensor (channels x samples).
pub fn demodulate_iq_channels(rf_tensor: &Tensor, f0: f64, fs: f64, decimation: usize) -> Tensor {
    assert_eq!(rf_tensor.rank(), 2, "demodulate_iq_channels requires 2D tensor");
    let f = rf_tensor.to_float();
    let slice = f.as_slice_f64().unwrap();

    let num_channels = rf_tensor.shape[0];
    let num_samples = rf_tensor.shape[1];
    let dec = decimation.max(1);
    let out_samples = (num_samples + dec - 1) / dec;

    let mut out_data = Vec::with_capacity(num_channels * out_samples);

    for ch in 0..num_channels {
        let ch_slice = &slice[ch * num_samples..(ch + 1) * num_samples];
        let ch_iq = demodulate_iq_1d(ch_slice, f0, fs, decimation);
        out_data.extend_from_slice(&ch_iq);
    }

    Tensor {
        shape: vec![num_channels, out_samples],
        strides: vec![out_samples, 1],
        data: TensorData::Complex(out_data),
    }
}
