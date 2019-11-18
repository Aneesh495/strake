//! Kasai 2D complex autocorrelation Doppler flow velocity estimator.
//!
//! Estimates axial blood flow velocity, Doppler power, and spectral variance
//! from slow-time complex baseband ensemble packets y[depth, pulse].

use std::f64::consts::PI;
use num_complex::Complex64;
use crate::tensor::{Tensor, TensorData};

/// Doppler velocity and power estimates.
#[derive(Debug, Clone)]
pub struct DopplerEstimate {
    pub velocity: Tensor, // Axial flow velocity (m/s)
    pub power: Tensor,    // Doppler power / perfusion intensity
    pub variance: Tensor, // Flow turbulence / spectral spread
}

/// Compute Kasai 2D autocorrelation velocity and power.
/// `ensemble`: (num_depths, num_pulses) complex baseband tensor.
/// `f0`: Ultrasound center frequency (Hz).
/// `prf`: Pulse repetition frequency (Hz).
/// `c`: Speed of sound (m/s).
pub fn kasai_autocorrelation(
    ensemble: &Tensor,
    f0: f64,
    prf: f64,
    c: f64,
) -> DopplerEstimate {
    assert_eq!(ensemble.rank(), 2, "ensemble must be 2D: (depths, pulses)");
    let comp = ensemble.to_complex();
    let slice = comp.as_slice_complex().unwrap();

    let num_depths = ensemble.shape[0];
    let num_pulses = ensemble.shape[1];
    assert!(num_pulses >= 2, "Kasai estimator requires at least 2 ensemble pulses");

    let mut velocity_data = Vec::with_capacity(num_depths);
    let mut power_data = Vec::with_capacity(num_depths);
    let mut variance_data = Vec::with_capacity(num_depths);

    // Scaling factor from phase angle to velocity: v = (c * prf) / (4 * pi * f0) * delta_phi
    let v_scale = (c * prf) / (4.0 * PI * f0);

    for d in 0..num_depths {
        let row = &slice[d * num_pulses..(d + 1) * num_pulses];

        let mut r1 = Complex64::new(0.0, 0.0);
        let mut r0 = 0.0;

        for k in 1..num_pulses {
            let curr = row[k];
            let prev = row[k - 1];
            r1 += curr * prev.conj();
            r0 += curr.norm_sqr();
        }
        r0 += row[0].norm_sqr();
        r0 /= num_pulses as f64;

        // Mean phase shift delta_phi = atan2(Im(R1), Re(R1))
        let delta_phi = r1.im.atan2(r1.re);
        let vel = v_scale * delta_phi;

        // Turbulence variance: 1 - |R1| / R0
        let r1_norm = r1.norm() / ((num_pulses - 1) as f64);
        let var = if r0 > 1e-12 {
            (1.0 - (r1_norm / r0).min(1.0)).max(0.0)
        } else {
            0.0
        };

        velocity_data.push(vel);
        power_data.push(r0);
        variance_data.push(var);
    }

    DopplerEstimate {
        velocity: Tensor {
            shape: vec![num_depths],
            strides: vec![1],
            data: TensorData::Float(velocity_data),
        },
        power: Tensor {
            shape: vec![num_depths],
            strides: vec![1],
            data: TensorData::Float(power_data),
        },
        variance: Tensor {
            shape: vec![num_depths],
            strides: vec![1],
            data: TensorData::Float(variance_data),
        },
    }
}
