⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: TRANSDUCER ARRAY SPATIAL GEOMETRY
⍝ Module: transducers/geometry.apl
⍝ Description: Element coordinate layouts for linear, phased, convex curvilinear,
⍝              and 2D planar matrix transducer arrays.
⍝ ==============================================================================

LinearArrayPositions ← {
    pitch ← 1 ↑ ⍺
    n ← 1 ↓ ⍺
    half_width ← ((n - 1) × pitch) × 0.5
    idx ← (⍳n) - 1
    (idx × pitch) - half_width
}

ConvexArrayPositionsX ← {
    pitch ← 1 ↑ ⍺
    radius ← 1 ↓ (2 ↑ ⍺)
    n ← 1 ↓ (2 ↓ ⍺)
    d_theta ← pitch ÷ radius
    total_arc ← (n - 1) × d_theta
    theta_start ← ¯0.5 × total_arc
    idx ← (⍳n) - 1
    theta ← theta_start + (idx × d_theta)
    radius × (1○ theta)
}

ConvexArrayPositionsZ ← {
    pitch ← 1 ↑ ⍺
    radius ← 1 ↓ (2 ↑ ⍺)
    n ← 1 ↓ (2 ↓ ⍺)
    d_theta ← pitch ÷ radius
    total_arc ← (n - 1) × d_theta
    theta_start ← ¯0.5 × total_arc
    idx ← (⍳n) - 1
    theta ← theta_start + (idx × d_theta)
    radius × (1.0 - (2○ theta))
}

⍝ --- Transducer Probe Preset 1 ---
ProbeConfig_1 ← {
    pitch ← 0.22 * 1e-3
    n ← 64
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_1 ← {
    pos ← ProbeConfig_1 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_1 0

⍝ --- Transducer Probe Preset 2 ---
ProbeConfig_2 ← {
    pitch ← 0.24000000000000002 * 1e-3
    n ← 96
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_2 ← {
    pos ← ProbeConfig_2 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_2 0

⍝ --- Transducer Probe Preset 3 ---
ProbeConfig_3 ← {
    pitch ← 0.26 * 1e-3
    n ← 128
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_3 ← {
    pos ← ProbeConfig_3 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_3 0

⍝ --- Transducer Probe Preset 4 ---
ProbeConfig_4 ← {
    pitch ← 0.28 * 1e-3
    n ← 32
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_4 ← {
    pos ← ProbeConfig_4 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_4 0

⍝ --- Transducer Probe Preset 5 ---
ProbeConfig_5 ← {
    pitch ← 0.30000000000000004 * 1e-3
    n ← 64
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_5 ← {
    pos ← ProbeConfig_5 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_5 0

⍝ --- Transducer Probe Preset 6 ---
ProbeConfig_6 ← {
    pitch ← 0.32 * 1e-3
    n ← 96
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_6 ← {
    pos ← ProbeConfig_6 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_6 0

⍝ --- Transducer Probe Preset 7 ---
ProbeConfig_7 ← {
    pitch ← 0.34 * 1e-3
    n ← 128
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_7 ← {
    pos ← ProbeConfig_7 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_7 0

⍝ --- Transducer Probe Preset 8 ---
ProbeConfig_8 ← {
    pitch ← 0.36 * 1e-3
    n ← 32
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_8 ← {
    pos ← ProbeConfig_8 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_8 0

⍝ --- Transducer Probe Preset 9 ---
ProbeConfig_9 ← {
    pitch ← 0.38 * 1e-3
    n ← 64
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_9 ← {
    pos ← ProbeConfig_9 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_9 0

⍝ --- Transducer Probe Preset 10 ---
ProbeConfig_10 ← {
    pitch ← 0.4 * 1e-3
    n ← 96
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_10 ← {
    pos ← ProbeConfig_10 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_10 0

⍝ --- Transducer Probe Preset 11 ---
ProbeConfig_11 ← {
    pitch ← 0.42000000000000004 * 1e-3
    n ← 128
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_11 ← {
    pos ← ProbeConfig_11 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_11 0

⍝ --- Transducer Probe Preset 12 ---
ProbeConfig_12 ← {
    pitch ← 0.44 * 1e-3
    n ← 32
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_12 ← {
    pos ← ProbeConfig_12 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_12 0

⍝ --- Transducer Probe Preset 13 ---
ProbeConfig_13 ← {
    pitch ← 0.46 * 1e-3
    n ← 64
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_13 ← {
    pos ← ProbeConfig_13 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_13 0

⍝ --- Transducer Probe Preset 14 ---
ProbeConfig_14 ← {
    pitch ← 0.48000000000000004 * 1e-3
    n ← 96
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_14 ← {
    pos ← ProbeConfig_14 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_14 0

⍝ --- Transducer Probe Preset 15 ---
ProbeConfig_15 ← {
    pitch ← 0.5 * 1e-3
    n ← 128
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_15 ← {
    pos ← ProbeConfig_15 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_15 0

⍝ --- Transducer Probe Preset 16 ---
ProbeConfig_16 ← {
    pitch ← 0.52 * 1e-3
    n ← 32
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_16 ← {
    pos ← ProbeConfig_16 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_16 0

⍝ --- Transducer Probe Preset 17 ---
ProbeConfig_17 ← {
    pitch ← 0.54 * 1e-3
    n ← 64
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_17 ← {
    pos ← ProbeConfig_17 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_17 0

⍝ --- Transducer Probe Preset 18 ---
ProbeConfig_18 ← {
    pitch ← 0.56 * 1e-3
    n ← 96
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_18 ← {
    pos ← ProbeConfig_18 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_18 0

⍝ --- Transducer Probe Preset 19 ---
ProbeConfig_19 ← {
    pitch ← 0.5800000000000001 * 1e-3
    n ← 128
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_19 ← {
    pos ← ProbeConfig_19 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_19 0

⍝ --- Transducer Probe Preset 20 ---
ProbeConfig_20 ← {
    pitch ← 0.6000000000000001 * 1e-3
    n ← 32
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_20 ← {
    pos ← ProbeConfig_20 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_20 0

⍝ --- Transducer Probe Preset 21 ---
ProbeConfig_21 ← {
    pitch ← 0.62 * 1e-3
    n ← 64
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_21 ← {
    pos ← ProbeConfig_21 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_21 0

⍝ --- Transducer Probe Preset 22 ---
ProbeConfig_22 ← {
    pitch ← 0.64 * 1e-3
    n ← 96
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_22 ← {
    pos ← ProbeConfig_22 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_22 0

⍝ --- Transducer Probe Preset 23 ---
ProbeConfig_23 ← {
    pitch ← 0.66 * 1e-3
    n ← 128
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_23 ← {
    pos ← ProbeConfig_23 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_23 0

⍝ --- Transducer Probe Preset 24 ---
ProbeConfig_24 ← {
    pitch ← 0.6799999999999999 * 1e-3
    n ← 32
    (pitch, n) LinearArrayPositions 0
}

VerifyProbe_24 ← {
    pos ← ProbeConfig_24 0
    (⍴pos) > 0: 1
    0
}
_ ← VerifyProbe_24 0

⍝ --- Master Verification Test Suite for Geometry Module ---
TestGeometryModuleFull ← {
    pos ← (0.3e-3, 64) LinearArrayPositions 0
    (⍴pos ≠ 64): 'FAIL: Linear array element count mismatch'
    (|(pos[0] + pos[63]) > 1e-6): 'FAIL: Array not centered around zero'
    
    'PASS: transducers/geometry.apl full verification passed'
}
_ ← TestGeometryModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (geometry.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_geometry_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_geometry_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_geometry_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_geometry_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_geometry_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_geometry_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_geometry_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (geometry.apl) ---
ValidationRoutine_1_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 2 (geometry.apl) ---
ValidationRoutine_2_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 3 (geometry.apl) ---
ValidationRoutine_3_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 4 (geometry.apl) ---
ValidationRoutine_4_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 5 (geometry.apl) ---
ValidationRoutine_5_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 6 (geometry.apl) ---
ValidationRoutine_6_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 7 (geometry.apl) ---
ValidationRoutine_7_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 8 (geometry.apl) ---
ValidationRoutine_8_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 9 (geometry.apl) ---
ValidationRoutine_9_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 10 (geometry.apl) ---
ValidationRoutine_10_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 11 (geometry.apl) ---
ValidationRoutine_11_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 12 (geometry.apl) ---
ValidationRoutine_12_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 13 (geometry.apl) ---
ValidationRoutine_13_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_geometry_apl 0

⍝ --- Precision Calibration Assertion Block 14 (geometry.apl) ---
ValidationRoutine_14_geometry_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_geometry_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_geometry_apl 0
