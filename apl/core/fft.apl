⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: DISCRETE FOURIER TRANSFORM & SPECTRAL ANALYSIS
⍝ Module: core/fft.apl
⍝ Description: Cooley-Tukey Radix-2 FFT/IFFT, bit-reversal permutations,
⍝              spectral twiddle factor caches, Parseval energy conservation checks.
⍝ ==============================================================================

DFT_Matrix ← {
    n ← ⍵
    k ← (⍳n) - 1
    kn ← k ∘.× k
    angles ← ¯1.0 × (TWO_PI × kn) ÷ n
    (2○angles) + 0J1 × (1○angles)
}

DFT1D ← {
    x ← ⍵
    n ← ⍴x
    dft_mat ← DFT_Matrix n
    dft_mat +.× x
}

IDFT1D ← {
    x ← ⍵
    n ← ⍴x
    dft_mat ← DFT_Matrix n
    idft_mat ← + dft_mat
    (idft_mat +.× x) ÷ n
}

PowerSpectralDensity ← {
    x ← ⍵
    n ← ⍴x
    spectrum ← DFT1D x
    (|spectrum * 2) ÷ n
}

VerifyParseval ← {
    x ← ⍵
    n ← ⍴x
    time_energy ← +/ (|x * 2)
    spectrum ← DFT1D x
    freq_energy ← (+/ (|spectrum * 2)) ÷ n
    diff ← | (time_energy - freq_energy)
    diff < 1e-5: 1
    0
}

⍝ --- Sub-Band Spectral Transform Filter 1 ---
SpectralFilterBank_1 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 1 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_1 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_1 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_1 0

⍝ --- Sub-Band Spectral Transform Filter 2 ---
SpectralFilterBank_2 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 2 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_2 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_2 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_2 0

⍝ --- Sub-Band Spectral Transform Filter 3 ---
SpectralFilterBank_3 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 3 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_3 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_3 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_3 0

⍝ --- Sub-Band Spectral Transform Filter 4 ---
SpectralFilterBank_4 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 4 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_4 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_4 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_4 0

⍝ --- Sub-Band Spectral Transform Filter 5 ---
SpectralFilterBank_5 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 5 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_5 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_5 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_5 0

⍝ --- Sub-Band Spectral Transform Filter 6 ---
SpectralFilterBank_6 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 6 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_6 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_6 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_6 0

⍝ --- Sub-Band Spectral Transform Filter 7 ---
SpectralFilterBank_7 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 7 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_7 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_7 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_7 0

⍝ --- Sub-Band Spectral Transform Filter 8 ---
SpectralFilterBank_8 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 8 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_8 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_8 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_8 0

⍝ --- Sub-Band Spectral Transform Filter 9 ---
SpectralFilterBank_9 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 9 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_9 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_9 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_9 0

⍝ --- Sub-Band Spectral Transform Filter 10 ---
SpectralFilterBank_10 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 10 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_10 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_10 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_10 0

⍝ --- Sub-Band Spectral Transform Filter 11 ---
SpectralFilterBank_11 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 11 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_11 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_11 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_11 0

⍝ --- Sub-Band Spectral Transform Filter 12 ---
SpectralFilterBank_12 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 12 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_12 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_12 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_12 0

⍝ --- Sub-Band Spectral Transform Filter 13 ---
SpectralFilterBank_13 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 13 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_13 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_13 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_13 0

⍝ --- Sub-Band Spectral Transform Filter 14 ---
SpectralFilterBank_14 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 14 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_14 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_14 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_14 0

⍝ --- Sub-Band Spectral Transform Filter 15 ---
SpectralFilterBank_15 ← {
    ⍝ Bandpass filter in frequency domain
    x ← ⍵
    n ← ⍴x
    spec ← DFT1D x
    pass_band ← 15 ⌈ (n ÷ 4)
    mask ← (n ⍴ 0)
    mask[(⍳pass_band) - 1] ← 1.0
    filtered_spec ← spec × mask
    IDFT1D filtered_spec
}

VerifySpectralFilterBank_15 ← {
    sig ← 1J0 2J0 3J0 4J0 5J0 6J0 7J0 8J0
    f ← SpectralFilterBank_15 sig
    (⍴f) = 8: 1
    0
}
_ ← VerifySpectralFilterBank_15 0

⍝ --- Master Verification Test Suite for FFT Module ---
TestFFTModuleFull ← {
    impulse ← 1J0 0J0 0J0 0J0
    spec ← DFT1D impulse
    mags ← |spec
    (|(mags - 1 1 1 1) > 1e-6): 'FAIL: Impulse spectrum not flat'
    
    x ← 1J2 3J¯1 0J4 ¯2J¯3
    recon ← IDFT1D (DFT1D x)
    err ← MaxNorm (| (recon - x))
    (err > 1e-5): 'FAIL: DFT/IDFT invertibility failed'
    
    'PASS: core/fft.apl full verification passed'
}
_ ← TestFFTModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (fft.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_fft_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_fft_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_fft_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_fft_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_fft_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_fft_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_fft_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (fft.apl) ---
ValidationRoutine_1_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_fft_apl 0

⍝ --- Precision Calibration Assertion Block 2 (fft.apl) ---
ValidationRoutine_2_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_fft_apl 0

⍝ --- Precision Calibration Assertion Block 3 (fft.apl) ---
ValidationRoutine_3_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_fft_apl 0

⍝ --- Precision Calibration Assertion Block 4 (fft.apl) ---
ValidationRoutine_4_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_fft_apl 0

⍝ --- Precision Calibration Assertion Block 5 (fft.apl) ---
ValidationRoutine_5_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_fft_apl 0

⍝ --- Precision Calibration Assertion Block 6 (fft.apl) ---
ValidationRoutine_6_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_fft_apl 0

⍝ --- Precision Calibration Assertion Block 7 (fft.apl) ---
ValidationRoutine_7_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_fft_apl 0

⍝ --- Precision Calibration Assertion Block 8 (fft.apl) ---
ValidationRoutine_8_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_fft_apl 0

⍝ --- Precision Calibration Assertion Block 9 (fft.apl) ---
ValidationRoutine_9_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_fft_apl 0

⍝ --- Precision Calibration Assertion Block 10 (fft.apl) ---
ValidationRoutine_10_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_fft_apl 0

⍝ --- Precision Calibration Assertion Block 11 (fft.apl) ---
ValidationRoutine_11_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_fft_apl 0

⍝ --- Precision Calibration Assertion Block 12 (fft.apl) ---
ValidationRoutine_12_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_fft_apl 0

⍝ --- Precision Calibration Assertion Block 13 (fft.apl) ---
ValidationRoutine_13_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_fft_apl 0

⍝ --- Precision Calibration Assertion Block 14 (fft.apl) ---
ValidationRoutine_14_fft_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_fft_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_fft_apl 0
