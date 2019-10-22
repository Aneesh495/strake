//! Discrete Hilbert transform and analytic signal generation.
//!
//! Converts real RF acoustic signals into complex analytic representations
//! s_a(t) = s(t) + j * H{s(t)}, where envelope is |s_a(t)| and instantaneous phase
//! is arg(s_a(t)).

use num_complex::Complex64;
use crate::tensor::{Tensor, TensorData};
use crate::dsp::fft::{fft_1d, ifft_1d};

/// Compute the analytic signal of a 1D real signal using the Hilbert transform.
pub fn hilbert_1d(signal: &[f64]) -> Vec<Complex64> {
    let orig_len = signal.len();
    let n = orig_len.next_power_of_two();

    let mut complex_in = vec![Complex64::new(0.0, 0.0); n];
    for (i, &val) in signal.iter().enumerate() {
        complex_in[i] = Complex64::new(val, 0.0);
    }

    // Step 1: Forward FFT
    let mut spectrum = fft_1d(&complex_in);

    // Step 2: Zero out negative frequencies and double positive frequencies
    let half = n / 2;
    for k in 1..half {
        spectrum[k] *= 2.0;
    }
    for k in (half + 1)..n {
        spectrum[k] = Complex64::new(0.0, 0.0);
    }

    // Step 3: Inverse FFT
    let analytic = ifft_1d(&spectrum);

    // Truncate to original length
    analytic[..orig_len].to_vec()
}

/// Compute analytic signal across each channel of a 2D tensor (channels x samples).
pub fn hilbert_channels(rf_data: &Tensor) -> Tensor {
    assert_eq!(rf_data.rank(), 2, "hilbert_channels requires a 2D tensor");
    let f = rf_data.to_float();
    let slice = f.as_slice_f64().unwrap();

    let num_channels = rf_data.shape[0];
    let num_samples = rf_data.shape[1];

    let mut out_data = Vec::with_capacity(num_channels * num_samples);

    for ch in 0..num_channels {
        let ch_slice = &slice[ch * num_samples..(ch + 1) * num_samples];
        let ch_analytic = hilbert_1d(ch_slice);
        out_data.extend_from_slice(&ch_analytic);
    }

    Tensor {
        shape: vec![num_channels, num_samples],
        strides: vec![num_samples, 1],
        data: TensorData::Complex(out_data),
    }
}

/// Compute envelope of RF signal |s_a(t)|.
pub fn envelope_2d(rf_data: &Tensor) -> Tensor {
    let analytic = hilbert_channels(rf_data);
    let c = analytic.as_slice_complex().unwrap();
    let env_data: Vec<f64> = c.iter().map(|z| z.norm()).collect();

    Tensor {
        shape: rf_data.shape.clone(),
        strides: rf_data.strides.clone(),
        data: TensorData::Float(env_data),
    }
}
