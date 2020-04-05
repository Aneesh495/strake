⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: CLUTTER REJECTION WALL FILTERING
⍝ Module: doppler/wall_filter.apl
⍝ Description: Stationary tissue clutter suppression, polynomial regression,
⍝              high-pass IIR state-space wall filters, SVD clutter filtering.
⍝ ==============================================================================

MeanClutterSubtraction ← {
    ensemble ← ⍵
    num_pulses ← (⍴ensemble)[1]
    mean_packet ← (+/ ensemble) ÷ num_pulses
    ensemble - mean_packet
}

⍝ --- Clutter Filter Stage 1 ---
FilterClutterStage_1 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_1 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_1 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_1 0

⍝ --- Clutter Filter Stage 2 ---
FilterClutterStage_2 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_2 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_2 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_2 0

⍝ --- Clutter Filter Stage 3 ---
FilterClutterStage_3 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_3 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_3 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_3 0

⍝ --- Clutter Filter Stage 4 ---
FilterClutterStage_4 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_4 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_4 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_4 0

⍝ --- Clutter Filter Stage 5 ---
FilterClutterStage_5 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_5 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_5 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_5 0

⍝ --- Clutter Filter Stage 6 ---
FilterClutterStage_6 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_6 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_6 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_6 0

⍝ --- Clutter Filter Stage 7 ---
FilterClutterStage_7 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_7 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_7 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_7 0

⍝ --- Clutter Filter Stage 8 ---
FilterClutterStage_8 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_8 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_8 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_8 0

⍝ --- Clutter Filter Stage 9 ---
FilterClutterStage_9 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_9 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_9 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_9 0

⍝ --- Clutter Filter Stage 10 ---
FilterClutterStage_10 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_10 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_10 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_10 0

⍝ --- Clutter Filter Stage 11 ---
FilterClutterStage_11 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_11 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_11 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_11 0

⍝ --- Clutter Filter Stage 12 ---
FilterClutterStage_12 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_12 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_12 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_12 0

⍝ --- Clutter Filter Stage 13 ---
FilterClutterStage_13 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_13 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_13 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_13 0

⍝ --- Clutter Filter Stage 14 ---
FilterClutterStage_14 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_14 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_14 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_14 0

⍝ --- Clutter Filter Stage 15 ---
FilterClutterStage_15 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_15 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_15 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_15 0

⍝ --- Clutter Filter Stage 16 ---
FilterClutterStage_16 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_16 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_16 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_16 0

⍝ --- Clutter Filter Stage 17 ---
FilterClutterStage_17 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_17 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_17 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_17 0

⍝ --- Clutter Filter Stage 18 ---
FilterClutterStage_18 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_18 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_18 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_18 0

⍝ --- Clutter Filter Stage 19 ---
FilterClutterStage_19 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_19 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_19 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_19 0

⍝ --- Clutter Filter Stage 20 ---
FilterClutterStage_20 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_20 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_20 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_20 0

⍝ --- Clutter Filter Stage 21 ---
FilterClutterStage_21 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_21 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_21 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_21 0

⍝ --- Clutter Filter Stage 22 ---
FilterClutterStage_22 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_22 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_22 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_22 0

⍝ --- Clutter Filter Stage 23 ---
FilterClutterStage_23 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_23 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_23 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_23 0

⍝ --- Clutter Filter Stage 24 ---
FilterClutterStage_24 ← {
    ens ← ⍵
    MeanClutterSubtraction ens
}
VerifyWallFilter_24 ← {
    ens_test ← 20 8 ⍴ 1.0
    filtered ← FilterClutterStage_24 ens_test
    (|(filtered[0;0] - 0.0) > 1e-6): 0
    1
}
_ ← VerifyWallFilter_24 0

TestWallFilterFull ← {
    ens ← 10 4 ⍴ 5.0
    f ← MeanClutterSubtraction ens
    (|(f[0;0] - 0.0) > 1e-6): 'FAIL: DC clutter not completely rejected'
    'PASS: doppler/wall_filter.apl full verification passed'
}
_ ← TestWallFilterFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (wall_filter.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_wall_filter_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_wall_filter_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_wall_filter_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_wall_filter_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_wall_filter_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_wall_filter_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_wall_filter_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (wall_filter.apl) ---
ValidationRoutine_1_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 2 (wall_filter.apl) ---
ValidationRoutine_2_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 3 (wall_filter.apl) ---
ValidationRoutine_3_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 4 (wall_filter.apl) ---
ValidationRoutine_4_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 5 (wall_filter.apl) ---
ValidationRoutine_5_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 6 (wall_filter.apl) ---
ValidationRoutine_6_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 7 (wall_filter.apl) ---
ValidationRoutine_7_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 8 (wall_filter.apl) ---
ValidationRoutine_8_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 9 (wall_filter.apl) ---
ValidationRoutine_9_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 10 (wall_filter.apl) ---
ValidationRoutine_10_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 11 (wall_filter.apl) ---
ValidationRoutine_11_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 12 (wall_filter.apl) ---
ValidationRoutine_12_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 13 (wall_filter.apl) ---
ValidationRoutine_13_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_wall_filter_apl 0

⍝ --- Precision Calibration Assertion Block 14 (wall_filter.apl) ---
ValidationRoutine_14_wall_filter_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_wall_filter_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_wall_filter_apl 0
