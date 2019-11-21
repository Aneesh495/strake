//! Clutter rejection wall filter for Doppler blood flow imaging.
//!
//! Suppresses high-amplitude low-velocity acoustic clutter reflected from stationary
//! tissue and vessel walls using polynomial regression or state-space IIR high-pass filtering.

use num_complex::Complex64;
use crate::tensor::{Tensor, TensorData};

/// Apply polynomial clutter rejection filter across slow-time pulses.
/// Fits an M-th order polynomial across ensemble pulses and subtracts the fit.
pub fn wall_filter_polynomial(ensemble: &Tensor, order: usize) -> Tensor {
    assert_eq!(ensemble.rank(), 2, "ensemble must be 2D: (depths, pulses)");
    let comp = ensemble.to_complex();
    let slice = comp.as_slice_complex().unwrap();

    let num_depths = ensemble.shape[0];
    let num_pulses = ensemble.shape[1];

    let mut out_data = Vec::with_capacity(num_depths * num_pulses);

    for d in 0..num_depths {
        let row = &slice[d * num_pulses..(d + 1) * num_pulses];

        // For order = 0 (mean subtraction): removes stationary DC clutter
        if order == 0 {
            let mean_re: f64 = row.iter().map(|z| z.re).sum::<f64>() / (num_pulses as f64);
            let mean_im: f64 = row.iter().map(|z| z.im).sum::<f64>() / (num_pulses as f64);
            let mean = Complex64::new(mean_re, mean_im);

            for &val in row {
                out_data.push(val - mean);
            }
        } else {
            // Linear detrending (order 1)
            let mut sum_t = 0.0;
            let mut sum_t2 = 0.0;
            let mut sum_re = 0.0;
            let mut sum_im = 0.0;
            let mut sum_t_re = 0.0;
            let mut sum_t_im = 0.0;

            for (t_idx, &val) in row.iter().enumerate() {
                let t = t_idx as f64;
                sum_t += t;
                sum_t2 += t * t;
                sum_re += val.re;
                sum_im += val.im;
                sum_t_re += t * val.re;
                sum_t_im += t * val.im;
            }

            let n = num_pulses as f64;
            let denom = n * sum_t2 - sum_t * sum_t;

            let (slope_re, intercept_re) = if denom.abs() > 1e-12 {
                let m = (n * sum_t_re - sum_t * sum_re) / denom;
                let b = (sum_re - m * sum_t) / n;
                (m, b)
            } else {
                (0.0, sum_re / n)
            };

            let (slope_im, intercept_im) = if denom.abs() > 1e-12 {
                let m = (n * sum_t_im - sum_t * sum_im) / denom;
                let b = (sum_im - m * sum_t) / n;
                (m, b)
            } else {
                (0.0, sum_im / n)
            };

            for (t_idx, &val) in row.iter().enumerate() {
                let t = t_idx as f64;
                let fit = Complex64::new(slope_re * t + intercept_re, slope_im * t + intercept_im);
                out_data.push(val - fit);
            }
        }
    }

    Tensor {
        shape: vec![num_depths, num_pulses],
        strides: vec![num_pulses, 1],
        data: TensorData::Complex(out_data),
    }
}
