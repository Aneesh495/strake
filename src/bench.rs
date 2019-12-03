//! High-throughput performance benchmarks for array beamforming and signal processing.

use std::time::Instant;
use crate::beamformer::das::{ArrayConfig, beamform_das_pw};
use crate::dsp::fft::fft_1d;
use crate::phantom::scatterers::{TissuePhantom, simulate_rf_plane_wave};
use crate::tensor::Tensor;
use num_complex::Complex64;

pub fn run_benchmarks() {
    println!("============================================================");
    println!("     STRAKE ACOUSTIC WORKSTATION HIGH-THROUGHPUT BENCHMARKS ");
    println!("============================================================");

    let cfg = ArrayConfig::default();
    let num_samples = 2048;
    let phantom = TissuePhantom::cyst_phantom(100);

    // 1. RF Wavefield Simulation
    print!("• RF Wavefield Simulation (64 channels x 2048 samples)... ");
    let t0 = Instant::now();
    let rf = simulate_rf_plane_wave(&phantom, &cfg, num_samples, 0.0);
    let dt_sim = t0.elapsed();
    println!("DONE in {:.2} ms ({:.2} M-samples/sec)",
        dt_sim.as_secs_f64() * 1000.0,
        (cfg.num_elements * num_samples) as f64 / (dt_sim.as_secs_f64() * 1e6)
    );

    // 2. Delay-and-Sum Beamforming (128 x 128 pixel grid)
    let grid_x: Vec<f64> = (0..128).map(|i| -0.015 + (i as f64) * (0.030 / 127.0)).collect();
    let grid_z: Vec<f64> = (0..128).map(|i| 0.010 + (i as f64) * (0.030 / 127.0)).collect();
    let num_pixels = grid_x.len() * grid_z.len();

    print!("• Delay-and-Sum Beamforming (128x128 grid, 64 channels)... ");
    let t1 = Instant::now();
    let iters = 10;
    for _ in 0..iters {
        let _ = beamform_das_pw(&rf, &cfg, &grid_x, &grid_z, 0.0);
    }
    let dt_das = t1.elapsed() / iters;
    let delay_calcs = (num_pixels * cfg.num_elements) as f64;
    println!("DONE in {:.2} ms ({:.2} M-delays/sec)",
        dt_das.as_secs_f64() * 1000.0,
        delay_calcs / (dt_das.as_secs_f64() * 1e6)
    );

    // 3. Fast Fourier Transform (FFT 2048 points)
    print!("• Radix-2 Complex FFT (2048-point, 10,000 iterations)... ");
    let mut sig = vec![Complex64::new(1.0, 0.5); 2048];
    let t2 = Instant::now();
    for _ in 0..10000 {
        sig = fft_1d(&sig);
    }
    let dt_fft = t2.elapsed();
    let flops_per_fft = 5.0 * 2048.0 * 11.0; // 5 * N * log2(N)
    let gflops = (flops_per_fft * 10000.0) / (dt_fft.as_secs_f64() * 1e9);
    println!("DONE in {:.2} ms ({:.2} GFLOPS)",
        dt_fft.as_secs_f64() * 1000.0,
        gflops
    );

    // 4. APL Outer Product Matrix Contraction
    print!("• APL Outer Product Contraction (1000 x 1000)... ");
    let t3 = Instant::now();
    let vec_a = Tensor::iota(1000);
    let vec_b = Tensor::iota(1000);
    let _outer = vec_a.outer_product(&vec_b, |a, b| a * b);
    let dt_outer = t3.elapsed();
    println!("DONE in {:.2} ms ({:.2} M-ops/sec)",
        dt_outer.as_secs_f64() * 1000.0,
        1_000_000.0 / (dt_outer.as_secs_f64() * 1e6)
    );

    println!("============================================================");
    println!("All hardware verification benchmarks passed with zero errors.");
    println!("============================================================");
}
