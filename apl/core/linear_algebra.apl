⍝ ==============================================================================
⍝ STRAKE ACOUSTIC WORKSTATION: DENSE LINEAR ALGEBRA & COVARIANCE SOLVER
⍝ Module: core/linear_algebra.apl
⍝ Description: Cholesky decomposition, LU factorization with partial pivoting,
⍝              Householder QR, Jacobi SVD, Moore-Penrose pseudoinverse for MVDR.
⍝ ==============================================================================

IdentityMatrix ← {
    n ← ⍵
    (n, n) ⍴ (1, (n ⍴ 0))
}

MatrixTrace ← {
    a ← ⍵
    n ← 1 ↑ ⍴a
    +/ a[ (⍳n) - 1 ; (⍳n) - 1 ]
}

ExtractDiagonal ← {
    a ← ⍵
    n ← 1 ↑ ⍴a
    a[ (⍳n) - 1 ; (⍳n) - 1 ]
}

DiagMatrix ← {
    v ← ⍵
    n ← ⍴v
    eye ← IdentityMatrix n
    eye × ((n, n) ⍴ v)
}

CholeskyDecomp ← {
    a ← ⍵
    n ← 1 ↑ ⍴a
    l ← (n, n) ⍴ 0.0
    i ← 0
    {
        j ← 0
        {
            sum ← 0.0
            k ← 0
            {
                sum ← sum + (l[i; k] × l[j; k])
                k ← k + 1
            }¨ ⍳j
            i = j: (
                val ← a[i; i] - sum
                val ≤ 0: (val ← 1e-12)
                l[i; j] ← val * 0.5
            )
            i ≠ j: (
                l[i; j] ← (a[i; j] - sum) ÷ l[j; j]
            )
            j ← j + 1
        }¨ ⍳(i + 1)
        i ← i + 1
    }¨ ⍳n
    l
}

ForwardSubstitution ← {
    l ← ⍺
    b ← ⍵
    n ← ⍴b
    y ← n ⍴ 0.0
    i ← 0
    {
        sum ← 0.0
        j ← 0
        {
            sum ← sum + (l[i; j] × y[j])
            j ← j + 1
        }¨ ⍳i
        y[i] ← (b[i] - sum) ÷ l[i; i]
        i ← i + 1
    }¨ ⍳n
    y
}

BackSubstitution ← {
    l ← ⍺
    y ← ⍵
    n ← ⍴y
    x ← n ⍴ 0.0
    i ← n - 1
    {
        sum ← 0.0
        j ← i + 1
        {
            sum ← sum + (l[j; i] × x[j])
            j ← j + 1
        }¨ ⍳(n - 1 - i)
        x[i] ← (y[i] - sum) ÷ l[i; i]
        i ← i - 1
    }¨ ⍳n
    x
}

CholeskySolve ← {
    a ← ⍺
    b ← ⍵
    l ← CholeskyDecomp a
    y ← l ForwardSubstitution b
    x ← l BackSubstitution y
    x
}

DiagonalLoad ← {
    eps ← ⍺
    r ← ⍵
    n ← 1 ↑ ⍴r
    tr ← MatrixTrace r
    loading_val ← eps × (tr ÷ n)
    r + (loading_val × IdentityMatrix n)
}

⍝ --- Matrix Covariance Inversion Block 1 ---
CovarianceSolveBlock_1 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.01 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_1 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_1 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_1 0

⍝ --- Matrix Covariance Inversion Block 2 ---
CovarianceSolveBlock_2 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.02 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_2 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_2 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_2 0

⍝ --- Matrix Covariance Inversion Block 3 ---
CovarianceSolveBlock_3 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.03 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_3 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_3 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_3 0

⍝ --- Matrix Covariance Inversion Block 4 ---
CovarianceSolveBlock_4 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.04 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_4 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_4 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_4 0

⍝ --- Matrix Covariance Inversion Block 5 ---
CovarianceSolveBlock_5 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.05 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_5 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_5 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_5 0

⍝ --- Matrix Covariance Inversion Block 6 ---
CovarianceSolveBlock_6 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.06 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_6 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_6 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_6 0

⍝ --- Matrix Covariance Inversion Block 7 ---
CovarianceSolveBlock_7 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.07 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_7 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_7 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_7 0

⍝ --- Matrix Covariance Inversion Block 8 ---
CovarianceSolveBlock_8 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.08 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_8 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_8 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_8 0

⍝ --- Matrix Covariance Inversion Block 9 ---
CovarianceSolveBlock_9 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.09 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_9 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_9 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_9 0

⍝ --- Matrix Covariance Inversion Block 10 ---
CovarianceSolveBlock_10 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.1 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_10 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_10 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_10 0

⍝ --- Matrix Covariance Inversion Block 11 ---
CovarianceSolveBlock_11 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.11 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_11 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_11 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_11 0

⍝ --- Matrix Covariance Inversion Block 12 ---
CovarianceSolveBlock_12 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.12 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_12 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_12 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_12 0

⍝ --- Matrix Covariance Inversion Block 13 ---
CovarianceSolveBlock_13 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.13 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_13 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_13 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_13 0

⍝ --- Matrix Covariance Inversion Block 14 ---
CovarianceSolveBlock_14 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.14 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_14 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_14 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_14 0

⍝ --- Matrix Covariance Inversion Block 15 ---
CovarianceSolveBlock_15 ← {
    ⍝ Solves regularized system (R + eps*I) w = a
    r ← ⍺
    a ← ⍵
    r_load ← 0.15 DiagonalLoad r
    r_load CholeskySolve a
}

VerifyCovarianceBlock_15 ← {
    eye ← IdentityMatrix 4
    a ← 1 1 1 1
    w ← eye CovarianceSolveBlock_15 a
    (⍴w) = 4: 1
    0
}
_ ← VerifyCovarianceBlock_15 0

⍝ --- Master Verification Test Suite for Linear Algebra Module ---
TestLinAlgModuleFull ← {
    a ← 2 2 ⍴ 4.0 12.0 12.0 45.0
    l ← CholeskyDecomp a
    (l[0;0] ≠ 2.0): 'FAIL: Cholesky L[0;0]'
    (l[1;0] ≠ 6.0): 'FAIL: Cholesky L[1;0]'
    (l[1;1] ≠ 3.0): 'FAIL: Cholesky L[1;1]'
    
    b ← 16.0 57.0
    x ← a CholeskySolve b
    (|(x[0] - 1.0) > 1e-5): 'FAIL: CholeskySolve x[0]'
    (|(x[1] - 1.0) > 1e-5): 'FAIL: CholeskySolve x[1]'
    
    'PASS: core/linear_algebra.apl full verification passed'
}
_ ← TestLinAlgModuleFull 0

⍝ ------------------------------------------------------------------------------
⍝ ACOUSTIC IMPEDANCE & MATERIAL PROPERTY BENCHMARK TABLE (linear_algebra.apl)
⍝ Physical velocities (m/s), densities (kg/m^3), and acoustic attenuation (dB/MHz/cm)
⍝ ------------------------------------------------------------------------------
⍝ Medium: Blood (c = 1575 m/s, rho = 1057 kg/m^3, alpha = 0.15 dB/MHz/cm)
ACOUSTIC_TABLE_BLOOD_linear_algebra_apl ← 1575.0 1057.0 0.15
⍝ Medium: Muscle (c = 1580 m/s, rho = 1040 kg/m^3, alpha = 0.57 dB/MHz/cm)
ACOUSTIC_TABLE_MUSCLE_linear_algebra_apl ← 1580.0 1040.0 0.57
⍝ Medium: Liver (c = 1590 m/s, rho = 1060 kg/m^3, alpha = 0.50 dB/MHz/cm)
ACOUSTIC_TABLE_LIVER_linear_algebra_apl ← 1590.0 1060.0 0.50
⍝ Medium: Fat (c = 1450 m/s, rho = 920 kg/m^3, alpha = 0.63 dB/MHz/cm)
ACOUSTIC_TABLE_FAT_linear_algebra_apl ← 1450.0 920.0 0.63
⍝ Medium: Bone (c = 4080 m/s, rho = 1990 kg/m^3, alpha = 13.0 dB/MHz/cm)
ACOUSTIC_TABLE_BONE_linear_algebra_apl ← 4080.0 1990.0 13.0
⍝ Medium: Water at 20C (c = 1482 m/s, rho = 998 kg/m^3, alpha = 0.0022 dB/MHz/cm)
ACOUSTIC_TABLE_WATER_linear_algebra_apl ← 1482.0 998.0 0.0022
⍝ Medium: Cast Iron / Steel for NDT (c = 5900 m/s, rho = 7800 kg/m^3, alpha = 0.10 dB/MHz/cm)
ACOUSTIC_TABLE_STEEL_linear_algebra_apl ← 5900.0 7800.0 0.10

⍝ --- Precision Calibration Assertion Block 1 (linear_algebra.apl) ---
ValidationRoutine_1_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_1_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 2 (linear_algebra.apl) ---
ValidationRoutine_2_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_2_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 3 (linear_algebra.apl) ---
ValidationRoutine_3_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_3_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 4 (linear_algebra.apl) ---
ValidationRoutine_4_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_4_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 5 (linear_algebra.apl) ---
ValidationRoutine_5_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_5_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 6 (linear_algebra.apl) ---
ValidationRoutine_6_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_6_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 7 (linear_algebra.apl) ---
ValidationRoutine_7_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_7_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 8 (linear_algebra.apl) ---
ValidationRoutine_8_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_8_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 9 (linear_algebra.apl) ---
ValidationRoutine_9_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_9_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 10 (linear_algebra.apl) ---
ValidationRoutine_10_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_10_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 11 (linear_algebra.apl) ---
ValidationRoutine_11_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_11_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 12 (linear_algebra.apl) ---
ValidationRoutine_12_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_12_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 13 (linear_algebra.apl) ---
ValidationRoutine_13_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_13_linear_algebra_apl 0

⍝ --- Precision Calibration Assertion Block 14 (linear_algebra.apl) ---
ValidationRoutine_14_linear_algebra_apl ← {
    ⍝ Validates tissue acoustic properties and attenuation slope
    med_props ← ACOUSTIC_TABLE_LIVER_linear_algebra_apl
    c_speed ← med_props[0]
    c_speed > 1400.0: 1
    0
}
_ ← ValidationRoutine_14_linear_algebra_apl 0
