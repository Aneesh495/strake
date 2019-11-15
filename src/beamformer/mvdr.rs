//! Minimum Variance Distortionless Response (MVDR / Capon) adaptive beamformer.
//!
//! Adaptively optimizes array receive weights to minimize total output variance
//! while maintaining unity gain in the look direction, achieving superior lateral
//! resolution and suppressing off-axis acoustic clutter.

/// Invert an NxN real symmetric positive-definite matrix via Cholesky decomposition.
pub fn invert_symmetric_matrix(mat: &[f64], n: usize) -> Result<Vec<f64>, String> {
    assert_eq!(mat.len(), n * n);

    // Cholesky decomposition L * L^T = A
    let mut l = vec![0.0; n * n];

    for i in 0..n {
        for j in 0..=i {
            let mut sum = 0.0;
            for k in 0..j {
                sum += l[i * n + k] * l[j * n + k];
            }

            if i == j {
                let diag = mat[i * n + i] - sum;
                if diag <= 0.0 {
                    return Err(format!("Matrix not positive definite at diagonal {i}: {diag}"));
                }
                l[i * n + j] = diag.sqrt();
            } else {
                let val = (mat[i * n + j] - sum) / l[j * n + j];
                l[i * n + j] = val;
            }
        }
    }

    // Invert lower triangular L: L_inv
    let mut l_inv = vec![0.0; n * n];
    for i in 0..n {
        l_inv[i * n + i] = 1.0 / l[i * n + i];
        for j in (i + 1)..n {
            let mut sum = 0.0;
            for k in i..j {
                sum += l[j * n + k] * l_inv[k * n + i];
            }
            l_inv[j * n + i] = -sum / l[j * n + j];
        }
    }

    // A_inv = L_inv^T * L_inv
    let mut a_inv = vec![0.0; n * n];
    for i in 0..n {
        for j in 0..n {
            let mut sum = 0.0;
            for k in 0..n {
                sum += l_inv[k * n + i] * l_inv[k * n + j];
            }
            a_inv[i * n + j] = sum;
        }
    }

    Ok(a_inv)
}

/// Compute MVDR adaptive weights for an array snapshot.
/// `covariance`: (n x n) sample covariance matrix
/// `diag_load_factor`: fraction of trace added to diagonal (typically 0.01 to 0.1)
pub fn compute_mvdr_weights(
    covariance: &[f64],
    n: usize,
    diag_load_factor: f64,
) -> Result<Vec<f64>, String> {
    let mut r_loaded = covariance.to_vec();

    // Compute trace
    let mut trace = 0.0;
    for i in 0..n {
        trace += covariance[i * n + i];
    }
    let epsilon = diag_load_factor * (trace / (n as f64)).max(1e-6);

    // Diagonal loading
    for i in 0..n {
        r_loaded[i * n + i] += epsilon;
    }

    // Invert loaded covariance
    let r_inv = invert_symmetric_matrix(&r_loaded, n)?;

    // Steering vector for broadside look-direction is uniform ones: a = [1, 1, ..., 1]^T
    let mut r_inv_a = vec![0.0; n];
    let mut denom = 0.0;

    for i in 0..n {
        let mut row_sum = 0.0;
        for j in 0..n {
            row_sum += r_inv[i * n + j];
        }
        r_inv_a[i] = row_sum;
        denom += row_sum;
    }

    if denom.abs() < 1e-12 {
        return Ok(vec![1.0 / (n as f64); n]);
    }

    let weights: Vec<f64> = r_inv_a.into_iter().map(|w| w / denom).collect();
    Ok(weights)
}
