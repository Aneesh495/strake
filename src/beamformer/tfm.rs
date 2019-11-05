//! Total Focusing Method (TFM) and Full Matrix Capture (FMC).
//!
//! Reconstructs ultra-high-resolution acoustic images from full matrix capture
//! datasets where every transducer element transmits sequentially and all elements
//! receive in parallel, achieving optimal synthetic dynamic focus at every pixel.

use rayon::prelude::*;
use crate::tensor::{Tensor, TensorData};
use crate::beamformer::das::{ArrayConfig, element_positions};

/// Perform Total Focusing Method (TFM) reconstruction from Full Matrix Capture (FMC).
/// `fmc_data` has shape (num_tx, num_rx, num_samples).
pub fn beamform_tfm(
    fmc_data: &Tensor,
    cfg: &ArrayConfig,
    grid_x: &[f64],
    grid_z: &[f64],
) -> Tensor {
    assert_eq!(fmc_data.rank(), 3, "fmc_data must have rank 3: (tx, rx, samples)");
    let f = fmc_data.to_float();
    let slice = f.as_slice_f64().unwrap();

    let num_tx = fmc_data.shape[0];
    let num_rx = fmc_data.shape[1];
    let num_samples = fmc_data.shape[2];

    let elem_x = element_positions(cfg);
    let c = cfg.speed_of_sound;
    let fs = cfg.sampling_freq;

    let nx = grid_x.len();
    let nz = grid_z.len();

    let output_grid: Vec<f64> = (0..nz).into_par_iter().flat_map(|iz| {
        let z = grid_z[iz];
        let mut row_pixels = Vec::with_capacity(nx);

        for ix in 0..nx {
            let x = grid_x[ix];
            let mut intensity = 0.0;
            let mut count = 0.0;

            for tx in 0..num_tx {
                let tx_x = elem_x[tx];
                let dist_tx = ((x - tx_x).powi(2) + z.powi(2)).sqrt();
                let tau_tx = dist_tx / c;

                for rx in 0..num_rx {
                    let rx_x = elem_x[rx];
                    let dist_rx = ((x - rx_x).powi(2) + z.powi(2)).sqrt();
                    let tau_rx = dist_rx / c;

                    let tau_total = tau_tx + tau_rx;
                    let sample_idx = (tau_total * fs).round() as isize;

                    if sample_idx >= 0 && (sample_idx as usize) < num_samples {
                        let offset = (tx * num_rx + rx) * num_samples + sample_idx as usize;
                        intensity += slice[offset];
                        count += 1.0;
                    }
                }
            }

            if count > 0.0 {
                intensity /= count;
            }
            row_pixels.push(intensity);
        }
        row_pixels
    }).collect();

    Tensor {
        shape: vec![nz, nx],
        strides: vec![nx, 1],
        data: TensorData::Float(output_grid),
    }
}
