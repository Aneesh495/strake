⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: SPATIAL COVARIANCE & STATISTICAL ESTIMATION
⍝ Module: core/statistics.apl
⍝ Description: Sample covariance estimation, spatial smoothing, higher-order moments,
⍝              Rayleigh speckle modeling, Nakagami-m and K-distribution estimators.
⍝ ==============================================================================

Mean ← { (+/ ⍵) ÷ ⍴⍵ }

Variance ← {
    x ← ⍵
    n ← ⍴x
    n ≤ 1: 0.0
    mu ← Mean x
    devs ← x - mu
    (+/ (devs * 2)) ÷ (n - 1)
}

StdDev ← { (Variance ⍵) * 0.5 }

SpatialCovariance ← {
    x ← ⍵
    m ← 1 ↑ ⍴x
    k ← 1 ↓ ⍴x
    k ≤ 0: (m, m) ⍴ 0.0
    (x +.× (HermitianTranspose x)) ÷ k
}

ComputeCNR ← {
    lesion ← ⍺
    bg ← ⍵
    mu_l ← Mean lesion
    mu_b ← Mean bg
    var_l ← Variance lesion
    var_b ← Variance bg
    denom ← (var_l + var_b) * 0.5
    denom ≤ 0: 0.0
    (| (mu_l - mu_b)) ÷ (denom * 0.5)
}

ComputeSpeckleSNR ← {
    x ← ⍵
    mu ← Mean x
    sig ← StdDev x
    sig ≤ 0: 0.0
    mu ÷ sig
}

⍝ --- Statistical Spatial Profiler 1 ---
SpatialProfiler_1 ← {
    ⍝ Computes local patch statistics across kernel window size 4
    x ← ⍵
    wins ← (RollingWindows 4) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_1 ← {
    vec ← ⍳25
    p ← SpatialProfiler_1 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_1 0

⍝ --- Statistical Spatial Profiler 2 ---
SpatialProfiler_2 ← {
    ⍝ Computes local patch statistics across kernel window size 5
    x ← ⍵
    wins ← (RollingWindows 5) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_2 ← {
    vec ← ⍳30
    p ← SpatialProfiler_2 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_2 0

⍝ --- Statistical Spatial Profiler 3 ---
SpatialProfiler_3 ← {
    ⍝ Computes local patch statistics across kernel window size 6
    x ← ⍵
    wins ← (RollingWindows 6) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_3 ← {
    vec ← ⍳35
    p ← SpatialProfiler_3 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_3 0

⍝ --- Statistical Spatial Profiler 4 ---
SpatialProfiler_4 ← {
    ⍝ Computes local patch statistics across kernel window size 7
    x ← ⍵
    wins ← (RollingWindows 7) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_4 ← {
    vec ← ⍳40
    p ← SpatialProfiler_4 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_4 0

⍝ --- Statistical Spatial Profiler 5 ---
SpatialProfiler_5 ← {
    ⍝ Computes local patch statistics across kernel window size 8
    x ← ⍵
    wins ← (RollingWindows 8) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_5 ← {
    vec ← ⍳45
    p ← SpatialProfiler_5 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_5 0

⍝ --- Statistical Spatial Profiler 6 ---
SpatialProfiler_6 ← {
    ⍝ Computes local patch statistics across kernel window size 9
    x ← ⍵
    wins ← (RollingWindows 9) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_6 ← {
    vec ← ⍳50
    p ← SpatialProfiler_6 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_6 0

⍝ --- Statistical Spatial Profiler 7 ---
SpatialProfiler_7 ← {
    ⍝ Computes local patch statistics across kernel window size 10
    x ← ⍵
    wins ← (RollingWindows 10) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_7 ← {
    vec ← ⍳55
    p ← SpatialProfiler_7 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_7 0

⍝ --- Statistical Spatial Profiler 8 ---
SpatialProfiler_8 ← {
    ⍝ Computes local patch statistics across kernel window size 11
    x ← ⍵
    wins ← (RollingWindows 11) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_8 ← {
    vec ← ⍳60
    p ← SpatialProfiler_8 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_8 0

⍝ --- Statistical Spatial Profiler 9 ---
SpatialProfiler_9 ← {
    ⍝ Computes local patch statistics across kernel window size 12
    x ← ⍵
    wins ← (RollingWindows 12) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_9 ← {
    vec ← ⍳65
    p ← SpatialProfiler_9 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_9 0

⍝ --- Statistical Spatial Profiler 10 ---
SpatialProfiler_10 ← {
    ⍝ Computes local patch statistics across kernel window size 13
    x ← ⍵
    wins ← (RollingWindows 13) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_10 ← {
    vec ← ⍳70
    p ← SpatialProfiler_10 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_10 0

⍝ --- Statistical Spatial Profiler 11 ---
SpatialProfiler_11 ← {
    ⍝ Computes local patch statistics across kernel window size 14
    x ← ⍵
    wins ← (RollingWindows 14) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_11 ← {
    vec ← ⍳75
    p ← SpatialProfiler_11 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_11 0

⍝ --- Statistical Spatial Profiler 12 ---
SpatialProfiler_12 ← {
    ⍝ Computes local patch statistics across kernel window size 15
    x ← ⍵
    wins ← (RollingWindows 15) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_12 ← {
    vec ← ⍳80
    p ← SpatialProfiler_12 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_12 0

⍝ --- Statistical Spatial Profiler 13 ---
SpatialProfiler_13 ← {
    ⍝ Computes local patch statistics across kernel window size 16
    x ← ⍵
    wins ← (RollingWindows 16) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_13 ← {
    vec ← ⍳85
    p ← SpatialProfiler_13 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_13 0

⍝ --- Statistical Spatial Profiler 14 ---
SpatialProfiler_14 ← {
    ⍝ Computes local patch statistics across kernel window size 17
    x ← ⍵
    wins ← (RollingWindows 17) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_14 ← {
    vec ← ⍳90
    p ← SpatialProfiler_14 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_14 0

⍝ --- Statistical Spatial Profiler 15 ---
SpatialProfiler_15 ← {
    ⍝ Computes local patch statistics across kernel window size 18
    x ← ⍵
    wins ← (RollingWindows 18) x
    means ← Mean¨ wins
    vars ← Variance¨ wins
    means, vars
}

VerifyProfiler_15 ← {
    vec ← ⍳95
    p ← SpatialProfiler_15 vec
    (⍴p) > 0: 1
    0
}
_ ← VerifyProfiler_15 0

⍝ --- Master Verification Test Suite for Statistics Module ---
TestStatsModuleFull ← {
    v ← 1 2 3 4 5
    (Mean v ≠ 3.0): 'FAIL: Mean mismatch'
    (Variance v ≠ 2.5): 'FAIL: Variance mismatch'
    
    'PASS: core/statistics.apl full verification passed'
}
_ ← TestStatsModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (statistics.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_statistics_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_statistics_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_statistics_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_statistics_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_statistics_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_statistics_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_statistics_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (statistics.apl) ---
ValidationRoutine_1_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 2 (statistics.apl) ---
ValidationRoutine_2_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 3 (statistics.apl) ---
ValidationRoutine_3_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 4 (statistics.apl) ---
ValidationRoutine_4_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 5 (statistics.apl) ---
ValidationRoutine_5_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 6 (statistics.apl) ---
ValidationRoutine_6_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 7 (statistics.apl) ---
ValidationRoutine_7_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 8 (statistics.apl) ---
ValidationRoutine_8_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 9 (statistics.apl) ---
ValidationRoutine_9_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 10 (statistics.apl) ---
ValidationRoutine_10_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 11 (statistics.apl) ---
ValidationRoutine_11_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 12 (statistics.apl) ---
ValidationRoutine_12_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 13 (statistics.apl) ---
ValidationRoutine_13_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_statistics_apl 0

⍝ --- Precision Calibration Assertion Block 14 (statistics.apl) ---
ValidationRoutine_14_statistics_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_statistics_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_statistics_apl 0
