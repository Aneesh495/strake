# Strake APL Pipeline Catalog & Module Specification

This document details the functional specifications, tensor rank transitions, and algorithms across all 62 modules in the `apl/` codebase.

---

## 1. Module Inventory by Domain

| Category | Modules | Core Responsibilities |
| :--- | :--- | :--- |
| **core/** | 7 files | Tensor algebra, numerical analysis, complex arithmetic, linear algebra, FFT, Hilbert, statistics |
| **dsp/** | 8 files | Window functions, FIR filters, IIR biquads, I/Q demodulation, TGC curves, pulse compression, polyphase, wavelets |
| **transducers/** | 4 files | Array geometries, baffled piston directivity, impulse responses, dynamic receive apertures |
| **beamforming/** | 9 files | Euclidean delays, DAS, DMAS, TFM, PWC, MVDR Capon, synthetic aperture, tissue harmonics, aberration |
| **imaging/** | 8 files | Analytic envelopes, log compression, scan conversion, SRAD diffusion, spatial compounding, metrics, colormaps, panoramic |
| **doppler/** | 4 files | Clutter wall filters, Kasai 2D autocorrelation, spectral sonograms, power Doppler |
| **elastography/** | 4 files | Sub-sample speckle tracking, axial strain tensors, shear wave speed inversion, Young's modulus |
| **phantoms/** | 4 files | Resolution wire targets, anechoic cysts, laminar flow tubes, Rayleigh-Sommerfeld wavefield fields |
| **pipelines/** | 5 files | Reference cardiac, vascular duplex, convex abdominal, industrial NDT FMC-TFM, ultrafast PWC |
| **tests/** | 9 files | Automated assertion suites testing all mathematical identities and tensor contracts |

---

## 2. Core Functional Contracts

### 2.1 Multi-Dimensional Reshaping (`apl/core/array.apl`)
- Signature: `NewShape ⍴ Tensor`
- Rank Transition: `R_in -> R_out = ⍴NewShape`
- Invariant: Cyclic repetition ensures continuous memory fill when `×/ NewShape ≠ ×/ ⍴Tensor`.

### 2.2 Discrete Hilbert Analytic Signal (`apl/core/hilbert.apl`)
- Signature: `AnalyticSignal RealSignal`
- Rank Transition: `[N] -> [N] (Complex64)`
- Formulation:
  $$s_a(t) = s(t) + j \cdot \mathcal{H}\{s(t)\}$$
  Frequency multiplier $H[0] = 1$, $H[1 \dots N/2-1] = 2$, $H[N/2 \dots N-1] = 0$.

### 2.3 Delay-and-Sum Beamforming (`apl/beamforming/das.apl`)
- Signature: `(Apodization, Delays) BeamformSampleDAS RFMatrix`
- Rank Transition: `[N_ch], [N_ch] -> [1] (Reconstructed pixel intensity)`
- Apodization: Dynamic Hanning or Tukey windowing across active receive channels.

### 2.4 Kasai 2D Autocorrelation (`apl/doppler/kasai.apl`)
- Signature: `(f0, PRF, c) KasaiLagOneAutocorrelation EnsemblePacket`
- Rank Transition: `[N_depths, N_pulses] -> [N_depths] (Flow Velocity in m/s)`
- Formulation:
  $$v = \frac{c \cdot f_{prf}}{4 \pi f_0} \cdot \arctan\left(\frac{\text{Im}(R_1)}{\text{Re}(R_1)}\right)$$
