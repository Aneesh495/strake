//! High-contrast terminal ASCII and ANSI grayscale ultrasound visualizer.
//!
//! Renders reconstructed logarithmic B-mode ultrasound frames directly into
//! standard terminal consoles with dynamic range clipping and aspect correction.

use crate::tensor::Tensor;

/// Render a 2D logarithmic B-mode tensor (depth x lateral) to an ASCII console string.
/// `dynamic_range_db`: dynamic range threshold (e.g. 50.0 dB).
pub fn render_ascii_bmode(image: &Tensor, dynamic_range_db: f64) -> String {
    assert_eq!(image.rank(), 2, "Image tensor must be 2D (depth x lateral)");
    let f = image.to_float();
    let slice = f.as_slice_f64().unwrap();

    let nz = image.shape[0];
    let nx = image.shape[1];

    // Find peak amplitude for normalization
    let mut max_val = 1e-12f64;
    for &val in slice {
        if val > max_val {
            max_val = val;
        }
    }

    // High-resolution ASCII grayscale ramp
    let ramp = [" ", ".", ":", "-", "=", "+", "*", "#", "%", "@"];
    let num_shades = ramp.len();

    let mut out = String::new();
    out.push_str(&format!(
        "--- Ultrasound B-Mode Preview ({}x{}, DR: {:.1} dB) ---\n",
        nx, nz, dynamic_range_db
    ));

    // Downsample if grid is larger than typical terminal (e.g. limit to 80 cols x 35 rows)
    let max_cols = 78;
    let max_rows = 32;

    let step_x = (nx / max_cols).max(1);
    let step_z = (nz / max_rows).max(1);

    for z_idx in (0..nz).step_by(step_z) {
        out.push('|');
        for x_idx in (0..nx).step_by(step_x) {
            let val = slice[z_idx * nx + x_idx];
            let val_norm = (val / max_val).max(1e-6);
            let db = 20.0 * val_norm.log10(); // <= 0 dB
            let clamped_db = db.max(-dynamic_range_db);
            let norm_intensity = (clamped_db + dynamic_range_db) / dynamic_range_db; // 0.0 to 1.0

            let shade_idx = ((norm_intensity * (num_shades - 1) as f64).round() as usize).min(num_shades - 1);
            out.push_str(ramp[shade_idx]);
        }
        out.push_str("|\n");
    }

    out.push_str(&format!("----------------------------------------------------------\n"));
    out
}
