//! Coherent Plane Wave Compounding (PWC).
//!
//! Synthesizes high-resolution, high-contrast B-mode frames by coherently summing
//! beamformed RF signals acquired across multiple tilted plane-wave transmissions.

use crate::tensor::{Tensor, TensorData};
use crate::beamformer::das::{ArrayConfig, beamform_das_pw};

/// Coherently compound multiple steered plane-wave acquisitions.
/// `rf_angles` is a vector of RF tensors (one per steering angle).
/// `angles_rad` is slice of steering angles in radians.
pub fn compound_plane_waves(
    rf_angles: &[Tensor],
    angles_rad: &[f64],
    cfg: &ArrayConfig,
    grid_x: &[f64],
    grid_z: &[f64],
) -> Tensor {
    assert_eq!(rf_angles.len(), angles_rad.len(), "Count of RF datasets and angles must match");
    let num_angles = angles_rad.len();
    assert!(num_angles > 0, "At least one angle required for compounding");

    let nz = grid_z.len();
    let nx = grid_x.len();
    let num_pixels = nz * nx;

    let mut accumulated = vec![0.0; num_pixels];

    for (rf, &theta) in rf_angles.iter().zip(angles_rad.iter()) {
        let frame = beamform_das_pw(rf, cfg, grid_x, grid_z, theta);
        let f = frame.to_float();
        let s = f.as_slice_f64().unwrap();
        for i in 0..num_pixels {
            accumulated[i] += s[i];
        }
    }

    let inv_m = 1.0 / (num_angles as f64);
    for val in accumulated.iter_mut() {
        *val *= inv_m;
    }

    Tensor {
        shape: vec![nz, nx],
        strides: vec![nx, 1],
        data: TensorData::Float(accumulated),
    }
}
