//! Physical acoustic phantom simulation and RF echo generation.
//!
//! Models point scatterers, tissue speckle textures, hypoechoic cysts,
//! and vascular flow lumens with forward acoustic wavefield propagation.

use std::f64::consts::PI;
use crate::tensor::{Tensor, TensorData};
use crate::beamformer::das::{ArrayConfig, element_positions};

/// Individual acoustic scatterer in 2D space.
#[derive(Debug, Clone, Copy)]
pub struct Scatterer {
    pub x: f64,          // Lateral position (m)
    pub z: f64,          // Axial depth (m)
    pub reflectivity: f64, // Acoustic impedance mismatch reflection coefficient
}

/// A composite tissue phantom containing scatterers and geometry.
#[derive(Debug, Clone)]
pub struct TissuePhantom {
    pub scatterers: Vec<Scatterer>,
}

impl TissuePhantom {
    /// Create a wire target resolution phantom: calibrated point scatterers at increasing depths.
    pub fn wire_target_phantom() -> Self {
        let mut sc = Vec::new();

        // Central vertical line of wire targets at z = 10mm, 20mm, 30mm, 40mm
        for &z_mm in &[10.0, 20.0, 30.0, 40.0] {
            sc.push(Scatterer {
                x: 0.0,
                z: z_mm * 1e-3,
                reflectivity: 1.0,
            });
        }

        // Horizontal lateral resolution wires at z = 25mm: x = -6mm, -3mm, 0mm, 3mm, 6mm
        for &x_mm in &[-6.0, -3.0, 3.0, 6.0] {
            sc.push(Scatterer {
                x: x_mm * 1e-3,
                z: 25.0 * 1e-3,
                reflectivity: 0.9,
            });
        }

        Self { scatterers: sc }
    }

    /// Create a cyst phantom: diffuse background speckle with an anechoic cyst and hyperechoic inclusion.
    pub fn cyst_phantom(num_background_scatterers: usize) -> Self {
        let mut sc = Vec::with_capacity(num_background_scatterers + 50);

        // Cyst 1: Anechoic cyst at (x = -4mm, z = 25mm), radius = 3mm
        let cyst1_x = -4.0e-3;
        let cyst1_z = 25.0e-3;
        let cyst1_r = 3.0e-3;

        // Cyst 2: Hyperechoic inclusion at (x = +4mm, z = 25mm), radius = 3mm
        let cyst2_x = 4.0e-3;
        let cyst2_z = 25.0e-3;
        let cyst2_r = 3.0e-3;

        // Deterministic pseudo-random generation (LCG)
        let mut seed: u64 = 133742;
        let mut lcg = || {
            seed = seed.wrapping_mul(6364136223846793005).wrapping_add(1442695040888963407);
            (seed >> 32) as f64 / 4294967296.0
        };

        let x_min = -10.0e-3;
        let x_max = 10.0e-3;
        let z_min = 10.0e-3;
        let z_max = 40.0e-3;

        for _ in 0..num_background_scatterers {
            let x = x_min + lcg() * (x_max - x_min);
            let z = z_min + lcg() * (z_max - z_min);

            let d1 = ((x - cyst1_x).powi(2) + (z - cyst1_z).powi(2)).sqrt();
            let d2 = ((x - cyst2_x).powi(2) + (z - cyst2_z).powi(2)).sqrt();

            if d1 < cyst1_r {
                // Anechoic cyst: zero or negligible reflectivity
                sc.push(Scatterer { x, z, reflectivity: 0.02 });
            } else if d2 < cyst2_r {
                // Hyperechoic inclusion: 3x background reflectivity
                let amp = 3.0 * (0.8 + 0.4 * lcg());
                sc.push(Scatterer { x, z, reflectivity: amp });
            } else {
                // Normal background Rayleigh speckle
                let amp = 0.5 + 0.5 * lcg();
                sc.push(Scatterer { x, z, reflectivity: amp });
            }
        }

        Self { scatterers: sc }
    }
}

/// Simulate multi-channel RF echo capture for a single plane wave transmit.
/// Returns (num_channels, num_samples) RF tensor.
pub fn simulate_rf_plane_wave(
    phantom: &TissuePhantom,
    cfg: &ArrayConfig,
    num_samples: usize,
    tx_angle_rad: f64,
) -> Tensor {
    let elem_x = element_positions(cfg);
    let c = cfg.speed_of_sound;
    let fs = cfg.sampling_freq;
    let f0 = cfg.center_freq;
    let dt = 1.0 / fs;

    let num_channels = cfg.num_elements;
    let mut rf_matrix = vec![0.0; num_channels * num_samples];

    let sin_theta = tx_angle_rad.sin();
    let cos_theta = tx_angle_rad.cos();

    // Pulse envelope width sigma = 1.5 / f0 (approx 2 cycles)
    let pulse_sigma = 1.2 / f0;
    let pulse_duration = 4.0 * pulse_sigma;

    for sc in &phantom.scatterers {
        if sc.reflectivity.abs() < 1e-4 {
            continue;
        }

        // Transmit delay
        let tau_tx = (sc.x * sin_theta + sc.z * cos_theta) / c;

        for ch in 0..num_channels {
            let rx_x = elem_x[ch];
            let dist_rx = ((sc.x - rx_x).powi(2) + sc.z.powi(2)).sqrt();
            let tau_rx = dist_rx / c;
            let tau_total = tau_tx + tau_rx;

            // Directivity / 1/r spreading attenuation
            let r_total = (sc.z.powi(2) + sc.x.powi(2)).sqrt().max(1e-3);
            let atten = sc.reflectivity / r_total.sqrt();

            let center_sample = (tau_total * fs).round() as isize;
            let half_window = (pulse_duration * fs).ceil() as isize;

            let s_start = 0.max(center_sample - half_window);
            let s_end = (num_samples as isize).min(center_sample + half_window);

            let row_offset = ch * num_samples;
            for s in s_start..s_end {
                let t = (s as f64) * dt;
                let t_rel = t - tau_total;
                let envelope = (-0.5 * (t_rel / pulse_sigma).powi(2)).exp();
                let carrier = (2.0 * PI * f0 * t_rel).cos();
                rf_matrix[row_offset + s as usize] += atten * envelope * carrier;
            }
        }
    }

    Tensor {
        shape: vec![num_channels, num_samples],
        strides: vec![num_samples, 1],
        data: TensorData::Float(rf_matrix),
    }
}
