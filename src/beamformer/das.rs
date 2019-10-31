//! Delay-and-Sum (DAS) beamformer.
//!
//! Reconstructs ultrasound B-mode scan lines from multi-channel RF echo matrices
//! by computing two-way Euclidean time-of-flight delays, applying dynamic apodization,
//! and summing coherently across active transducer channels.

use rayon::prelude::*;
use crate::tensor::{Tensor, TensorData};
use crate::dsp::filter::hanning_window;

/// Transducer array geometry configuration.
#[derive(Debug, Clone)]
pub struct ArrayConfig {
    pub num_elements: usize,
    pub pitch: f64,       // Element pitch in meters
    pub center_freq: f64, // Transducer center frequency in Hz
    pub sampling_freq: f64, // RF sampling frequency in Hz
    pub speed_of_sound: f64, // Acoustic sound speed in m/s (default 1540 m/s)
}

impl Default for ArrayConfig {
    fn default() -> Self {
        Self {
            num_elements: 64,
            pitch: 0.3e-3,       // 0.3 mm pitch
            center_freq: 5.0e6,  // 5 MHz
            sampling_freq: 40.0e6, // 40 MHz
            speed_of_sound: 1540.0, // 1540 m/s
        }
    }
}

/// Linear array element x-coordinates centered around 0.
pub fn element_positions(cfg: &ArrayConfig) -> Vec<f64> {
    let half_width = ((cfg.num_elements - 1) as f64) * cfg.pitch * 0.5;
    (0..cfg.num_elements)
        .map(|i| (i as f64) * cfg.pitch - half_width)
        .collect()
}

/// Perform Delay-and-Sum (DAS) beamforming on a single plane-wave or focused transmit.
/// `rf_data` is (num_channels, num_samples).
/// `grid_x` is 1D tensor of lateral positions (m).
/// `grid_z` is 1D tensor of axial depths (m).
/// `tx_angle_rad` is transmit steering angle (for plane wave).
pub fn beamform_das_pw(
    rf_data: &Tensor,
    cfg: &ArrayConfig,
    grid_x: &[f64],
    grid_z: &[f64],
    tx_angle_rad: f64,
) -> Tensor {
    assert_eq!(rf_data.rank(), 2, "rf_data must be (channels x samples)");
    let f_rf = rf_data.to_float();
    let rf_slice = f_rf.as_slice_f64().unwrap();
    let num_channels = rf_data.shape[0];
    let num_samples = rf_data.shape[1];

    let elem_x = element_positions(cfg);
    let c = cfg.speed_of_sound;
    let fs = cfg.sampling_freq;

    let nx = grid_x.len();
    let nz = grid_z.len();
    let _num_pixels = nx * nz;

    let apod = hanning_window(num_channels);

    // Parallelize over grid rows (z-depths) using Rayon
    let sin_theta = tx_angle_rad.sin();
    let cos_theta = tx_angle_rad.cos();

    let output_grid: Vec<f64> = (0..nz).into_par_iter().flat_map(|iz| {
        let z = grid_z[iz];
        let mut row_pixels = Vec::with_capacity(nx);

        for ix in 0..nx {
            let x = grid_x[ix];

            // Transmit delay for plane wave: (x * sin(theta) + z * cos(theta)) / c
            let tau_tx = (x * sin_theta + z * cos_theta) / c;

            let mut pixel_val = 0.0;
            let mut weight_sum = 0.0;

            for ch in 0..num_channels {
                let rx_x = elem_x[ch];
                let dist_rx = ((x - rx_x).powi(2) + z.powi(2)).sqrt();
                let tau_rx = dist_rx / c;
                let tau_total = tau_tx + tau_rx;

                let sample_idx = (tau_total * fs).round() as isize;

                if sample_idx >= 0 && (sample_idx as usize) < num_samples {
                    let w = apod[ch];
                    let val = rf_slice[ch * num_samples + sample_idx as usize];
                    pixel_val += w * val;
                    weight_sum += w;
                }
            }

            if weight_sum > 0.0 {
                pixel_val /= weight_sum;
            }
            row_pixels.push(pixel_val);
        }
        row_pixels
    }).collect();

    Tensor {
        shape: vec![nz, nx],
        strides: vec![nx, 1],
        data: TensorData::Float(output_grid),
    }
}
