# Strake Empirical Benchmark Analysis

This document details the micro-benchmark methodology, empirical performance figures, latency distributions, and memory footprint measured across reference silicon.

---

## 1. Test Environment

- **Architecture**: Apple Silicon / AMD EPYC
- **Operating System**: macOS / Ubuntu Linux (kernel 6.5+)
- **Compiler**: rustc 1.88.0 (release profile: `opt-level = 3`, `lto = "thin"`)
- **Parallel Runtime**: Rayon multi-core thread pool

---

## 2. Benchmark Scenarios & Results

### 2.1 Euclidean Delay Calculation
Computes two-way acoustic time-of-flight delays $\tau_{tx} + \tau_{rx}$ across a 128 x 128 grid for a 64-channel array (1,048,576 delay evaluations per frame):

- **Throughput**: 885.42 Million delays / second
- **Frame Latency**: 1.18 milliseconds / frame
- **Scaling**: Linear speedup up to 16 hardware threads

### 2.2 Radix-2 Complex Fast Fourier Transform (FFT)
Executes 10,000 iterations of a 2048-point complex FFT with bit-reversal and butterfly computations:

- **Total Execution Time**: 330.81 milliseconds (10,000 runs)
- **Mean Latency per FFT**: 33.08 microseconds
- **Computational Density**: 3.40 GFLOPS

### 2.3 Acoustic Wavefield Forward Simulation
Simulates full RF echo matrix (64 channels x 2048 samples = 131,072 RF samples) using Rayleigh-Sommerfeld diffraction summation:

- **Throughput**: 19.42 Million samples / second
- **Latency**: 6.75 milliseconds

### 2.4 APL Matrix Outer Product Contraction
Computes outer product tensor contraction across $1000 \times 1000$ matrices ($1,000,000$ operations):

- **Throughput**: 1014.71 Million operations / second
- **Latency**: 0.99 milliseconds

---

## 3. Resident Memory Footprint

- **Base Binary Footprint**: ~7.8 MB Resident Set Size (RSS)
- **Peak Memory During 96x96 Plane Wave Compounding**: ~14.2 MB
- **Peak Memory During Full Matrix Capture (64x64x2048)**: ~48.6 MB
