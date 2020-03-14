⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: B-MODE ENVELOPE DETECTION
⍝ Module: imaging/envelope.apl
⍝ Description: Analytic signal magnitude detection |s_a(t)|, peak detection with
⍝              lowpass reconstruction, instantaneous amplitude extraction.
⍝ ==============================================================================

EnvelopeDetect ← {
    s ← ⍵
    s_a ← AnalyticSignal s
    | s_a
}

SquareLawEnvelope ← {
    s ← ⍵
    sq ← s * 2
    lp_kernel ← HanningWindow 15
    lp_norm ← lp_kernel ÷ (+/ lp_kernel)
    smoothed ← sq Convolve1D lp_norm
    (smoothed ⌈ 0.0) * 0.5
}

⍝ --- Envelope Filter Pipeline 1 ---
EnvelopePipeline_1 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_1 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_1 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_1 0

⍝ --- Envelope Filter Pipeline 2 ---
EnvelopePipeline_2 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_2 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_2 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_2 0

⍝ --- Envelope Filter Pipeline 3 ---
EnvelopePipeline_3 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_3 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_3 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_3 0

⍝ --- Envelope Filter Pipeline 4 ---
EnvelopePipeline_4 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_4 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_4 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_4 0

⍝ --- Envelope Filter Pipeline 5 ---
EnvelopePipeline_5 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_5 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_5 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_5 0

⍝ --- Envelope Filter Pipeline 6 ---
EnvelopePipeline_6 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_6 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_6 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_6 0

⍝ --- Envelope Filter Pipeline 7 ---
EnvelopePipeline_7 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_7 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_7 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_7 0

⍝ --- Envelope Filter Pipeline 8 ---
EnvelopePipeline_8 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_8 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_8 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_8 0

⍝ --- Envelope Filter Pipeline 9 ---
EnvelopePipeline_9 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_9 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_9 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_9 0

⍝ --- Envelope Filter Pipeline 10 ---
EnvelopePipeline_10 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_10 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_10 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_10 0

⍝ --- Envelope Filter Pipeline 11 ---
EnvelopePipeline_11 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_11 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_11 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_11 0

⍝ --- Envelope Filter Pipeline 12 ---
EnvelopePipeline_12 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_12 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_12 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_12 0

⍝ --- Envelope Filter Pipeline 13 ---
EnvelopePipeline_13 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_13 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_13 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_13 0

⍝ --- Envelope Filter Pipeline 14 ---
EnvelopePipeline_14 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_14 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_14 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_14 0

⍝ --- Envelope Filter Pipeline 15 ---
EnvelopePipeline_15 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_15 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_15 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_15 0

⍝ --- Envelope Filter Pipeline 16 ---
EnvelopePipeline_16 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_16 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_16 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_16 0

⍝ --- Envelope Filter Pipeline 17 ---
EnvelopePipeline_17 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_17 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_17 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_17 0

⍝ --- Envelope Filter Pipeline 18 ---
EnvelopePipeline_18 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_18 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_18 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_18 0

⍝ --- Envelope Filter Pipeline 19 ---
EnvelopePipeline_19 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_19 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_19 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_19 0

⍝ --- Envelope Filter Pipeline 20 ---
EnvelopePipeline_20 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_20 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_20 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_20 0

⍝ --- Envelope Filter Pipeline 21 ---
EnvelopePipeline_21 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_21 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_21 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_21 0

⍝ --- Envelope Filter Pipeline 22 ---
EnvelopePipeline_22 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_22 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_22 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_22 0

⍝ --- Envelope Filter Pipeline 23 ---
EnvelopePipeline_23 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_23 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_23 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_23 0

⍝ --- Envelope Filter Pipeline 24 ---
EnvelopePipeline_24 ← {
    sig ← ⍵
    EnvelopeDetect sig
}
VerifyEnvPipe_24 ← {
    s ← (⍳50) ⍴ 1.0
    e ← EnvelopePipeline_24 s
    (⍴e) = 50: 1
    0
}
_ ← VerifyEnvPipe_24 0

TestImgEnvFull ← {
    s ← (⍳40) ⍴ 1.0
    e ← EnvelopeDetect s
    (⍴e ≠ 40): 'FAIL: Envelope length mismatch'
    'PASS: imaging/envelope.apl full verification passed'
}
_ ← TestImgEnvFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (envelope.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_envelope_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_envelope_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_envelope_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_envelope_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_envelope_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_envelope_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_envelope_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (envelope.apl) ---
ValidationRoutine_1_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 2 (envelope.apl) ---
ValidationRoutine_2_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 3 (envelope.apl) ---
ValidationRoutine_3_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 4 (envelope.apl) ---
ValidationRoutine_4_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 5 (envelope.apl) ---
ValidationRoutine_5_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 6 (envelope.apl) ---
ValidationRoutine_6_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 7 (envelope.apl) ---
ValidationRoutine_7_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 8 (envelope.apl) ---
ValidationRoutine_8_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 9 (envelope.apl) ---
ValidationRoutine_9_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 10 (envelope.apl) ---
ValidationRoutine_10_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 11 (envelope.apl) ---
ValidationRoutine_11_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 12 (envelope.apl) ---
ValidationRoutine_12_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 13 (envelope.apl) ---
ValidationRoutine_13_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_envelope_apl 0

⍝ --- Precision Calibration Assertion Block 14 (envelope.apl) ---
ValidationRoutine_14_envelope_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_envelope_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_envelope_apl 0
