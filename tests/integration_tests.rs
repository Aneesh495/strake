//! Integration verification test suite for Strake Acoustic Workstation.
//!
//! Validates end-to-end array algebra, digital signal processing, beamforming,
//! Doppler velocimetry, and acoustic wavefield forward models.

use std::f64::consts::PI;
use strake::tensor::Tensor;
use strake::dsp::fft::{fft_1d, ifft_1d};
use strake::dsp::hilbert::hilbert_1d;
use strake::dsp::filter::{hanning_window, hamming_window, tukey_window, generate_tgc_curve};
use strake::beamformer::das::{ArrayConfig, beamform_das_pw};
use strake::beamformer::mvdr::{compute_mvdr_weights, invert_symmetric_matrix};
use strake::doppler::kasai::kasai_autocorrelation;
use strake::doppler::wall_filter::wall_filter_polynomial;
use strake::phantom::scatterers::{TissuePhantom, simulate_rf_plane_wave, Scatterer};
use num_complex::Complex64;

#[test]
fn test_array_strides_and_reshape() {
    let t = Tensor::iota(24);
    assert_eq!(t.numel(), 24);
    assert_eq!(t.rank(), 1);

    let reshaped = t.reshape(vec![2, 3, 4]);
    assert_eq!(reshaped.shape, vec![2, 3, 4]);
    assert_eq!(reshaped.strides, vec![12, 4, 1]);
    assert_eq!(reshaped.rank(), 3);
}

#[test]
fn test_fft_ifft_invertibility() {
    let n = 256;
    let mut original = Vec::with_capacity(n);
    for i in 0..n {
        let t = (i as f64) / (n as f64);
        let val = (2.0 * PI * 5.0 * t).sin() + 0.5 * (2.0 * PI * 18.0 * t).cos();
        original.push(Complex64::new(val, 0.0));
    }

    let spectrum = fft_1d(&original);
    assert_eq!(spectrum.len(), n);

    let reconstructed = ifft_1d(&spectrum);
    assert_eq!(reconstructed.len(), n);

    for (orig, recon) in original.iter().zip(reconstructed.iter()) {
        assert!((orig.re - recon.re).abs() < 1e-10, "Real part invertibility failed");
        assert!((orig.im - recon.im).abs() < 1e-10, "Imag part invertibility failed");
    }
}

#[test]
fn test_hilbert_analytic_orthogonality() {
    let n = 128;
    let mut cosine_wave = Vec::with_capacity(n);
    for i in 0..n {
        let t = (i as f64) / (n as f64);
        cosine_wave.push((2.0 * PI * 4.0 * t).cos());
    }

    let analytic = hilbert_1d(&cosine_wave);
    assert_eq!(analytic.len(), n);

    // Analytic signal envelope of cos(omega*t) should equal 1.0 (excluding boundary transients)
    for i in 20..(n - 20) {
        let envelope = analytic[i].norm();
        assert!((envelope - 1.0).abs() < 0.05, "Envelope not unity: {}", envelope);
    }
}

#[test]
fn test_window_properties() {
    let n = 64;
    let hanning = hanning_window(n);
    assert_eq!(hanning.len(), n);
    assert!(hanning[0] < 1e-12);
    assert!((hanning[n / 2] - 1.0).abs() < 0.05);

    let hamming = hamming_window(n);
    assert_eq!(hamming.len(), n);
    assert!((hamming[0] - 0.08).abs() < 1e-2);

    let tukey = tukey_window(n, 0.5);
    assert_eq!(tukey.len(), n);
    assert!((tukey[n / 2] - 1.0).abs() < 1e-12);
}

#[test]
fn test_tgc_exponential_attenuation() {
    let n = 1000;
    let tgc = generate_tgc_curve(n, 40e6, 1540.0, 0.5, 5e6);
    let s = tgc.as_slice_f64().unwrap();
    assert_eq!(s.len(), n);
    assert!((s[0] - 1.0).abs() < 1e-12);
    assert!(s[n - 1] > s[0], "TGC gain must increase monotonically with depth");
}

#[test]
fn test_matrix_cholesky_and_inversion() {
    let n = 3;
    // Positive-definite 3x3 matrix
    let a = vec![
        4.0, 2.0, 1.0,
        2.0, 5.0, 2.0,
        1.0, 2.0, 6.0,
    ];

    let a_inv = invert_symmetric_matrix(&a, n).expect("Cholesky inversion failed");
    assert_eq!(a_inv.len(), 9);

    // Verify A * A_inv approx I
    for i in 0..n {
        for j in 0..n {
            let mut dot = 0.0;
            for k in 0..n {
                dot += a[i * n + k] * a_inv[k * n + j];
            }
            let expected = if i == j { 1.0 } else { 0.0 };
            assert!((dot - expected).abs() < 1e-8, "Matrix inverse verification failed at ({}, {})", i, j);
        }
    }
}

#[test]
fn test_mvdr_weight_normalization() {
    let n = 8;
    // Uniform diagonal covariance
    let mut cov = vec![0.0; n * n];
    for i in 0..n {
        cov[i * n + i] = 1.0;
    }

    let weights = compute_mvdr_weights(&cov, n, 0.05).expect("MVDR weight calculation failed");
    assert_eq!(weights.len(), n);

    let sum_w: f64 = weights.iter().sum();
    assert!((sum_w - 1.0).abs() < 1e-8, "Weights must sum to unity for distortionless constraint");

    for &w in &weights {
        assert!((w - (1.0 / n as f64)).abs() < 1e-6, "Weights must be uniform for identity covariance");
    }
}

#[test]
fn test_kasai_doppler_velocity() {
    let num_depths = 10;
    let num_pulses = 16;
    let f0 = 5.0e6;
    let prf = 5000.0;
    let c = 1540.0;

    // Simulate flow with known Doppler phase shift delta_phi = 0.5 rad per pulse
    let known_delta_phi = 0.5;
    let mut ensemble_data = Vec::with_capacity(num_depths * num_pulses);

    for _d in 0..num_depths {
        for p in 0..num_pulses {
            let phase = (p as f64) * known_delta_phi;
            ensemble_data.push(Complex64::from_polar(1.0, phase));
        }
    }

    let ensemble = Tensor {
        shape: vec![num_depths, num_pulses],
        strides: vec![num_pulses, 1],
        data: strake::tensor::TensorData::Complex(ensemble_data),
    };

    let estimate = kasai_autocorrelation(&ensemble, f0, prf, c);
    let v_slice = estimate.velocity.as_slice_f64().unwrap();
    let expected_v = (c * prf) / (4.0 * PI * f0) * known_delta_phi;

    for &v in v_slice {
        assert!((v - expected_v).abs() < 1e-5, "Kasai velocity mismatch: {} vs {}", v, expected_v);
    }
}

#[test]
fn test_wall_filter_stationary_rejection() {
    let num_depths = 5;
    let num_pulses = 12;

    // Simulate stationary clutter (constant DC component across pulses)
    let mut data = Vec::with_capacity(num_depths * num_pulses);
    for d in 0..num_depths {
        let dc = (d as f64) * 2.0 + 5.0;
        for _ in 0..num_pulses {
            data.push(Complex64::new(dc, dc * 0.5));
        }
    }

    let tensor = Tensor {
        shape: vec![num_depths, num_pulses],
        strides: vec![num_pulses, 1],
        data: strake::tensor::TensorData::Complex(data),
    };

    let filtered = wall_filter_polynomial(&tensor, 0);
    let s = filtered.as_slice_complex().unwrap();

    for &val in s {
        assert!(val.norm() < 1e-10, "Stationary clutter was not rejected by wall filter: {}", val);
    }
}

#[test]
fn test_das_point_scatterer_reconstruction() {
    let cfg = ArrayConfig {
        num_elements: 32,
        pitch: 0.3e-3,
        center_freq: 5.0e6,
        sampling_freq: 40.0e6,
        speed_of_sound: 1540.0,
    };

    let phantom = TissuePhantom {
        scatterers: vec![Scatterer {
            x: 0.0,
            z: 20.0e-3, // 20 mm depth
            reflectivity: 1.0,
        }],
    };

    let num_samples = 1500;
    let rf = simulate_rf_plane_wave(&phantom, &cfg, num_samples, 0.0);

    let grid_x = vec![0.0]; // exactly at scatterer x
    let grid_z: Vec<f64> = (15..25).map(|mm| (mm as f64) * 1e-3).collect();

    let bmode = beamform_das_pw(&rf, &cfg, &grid_x, &grid_z, 0.0);
    let slice = bmode.as_slice_f64().unwrap();

    // The peak should be around 20mm (index 5)
    let mut max_idx = 0;
    let mut max_val = 0.0;
    for (i, &val) in slice.iter().enumerate() {
        if val.abs() > max_val {
            max_val = val.abs();
            max_idx = i;
        }
    }

    assert_eq!(max_idx, 5, "Point scatterer did not reconstruct at expected 20mm depth");
}
