//! 16-bit Portable Graymap (PGM) image exporter.
//!
//! Serializes ultrasound B-mode matrices into standard binary Netpbm PGM formats
//! preserving full 16-bit dynamic range for scientific and clinical viewers.

use std::fs::File;
use std::io::{Write, BufWriter};
use std::path::Path;
use crate::tensor::Tensor;

/// Save a 2D image tensor to a binary 16-bit PGM file.
/// `dynamic_range_db`: dynamic range threshold for logarithmic mapping.
pub fn save_pgm_16bit<P: AsRef<Path>>(
    image: &Tensor,
    dynamic_range_db: f64,
    path: P,
) -> std::io::Result<()> {
    assert_eq!(image.rank(), 2, "Image must be 2D tensor (depth x lateral)");
    let f = image.to_float();
    let slice = f.as_slice_f64().unwrap();

    let nz = image.shape[0];
    let nx = image.shape[1];

    let mut max_val = 1e-12f64;
    for &val in slice {
        if val > max_val {
            max_val = val;
        }
    }

    let file = File::create(path)?;
    let mut writer = BufWriter::new(file);

    // Write PGM P5 binary header
    writeln!(writer, "P5")?;
    writeln!(writer, "# Strake Acoustic Workstation B-Mode Image")?;
    writeln!(writer, "{} {}", nx, nz)?;
    writeln!(writer, "65535")?; // 16-bit maximum value

    // Write 16-bit big-endian pixel values
    let mut row_bytes = Vec::with_capacity(nx * 2);
    for z in 0..nz {
        row_bytes.clear();
        for x in 0..nx {
            let val = slice[z * nx + x];
            let val_norm = (val / max_val).max(1e-6);
            let db = (20.0 * val_norm.log10()).max(-dynamic_range_db);
            let norm = ((db + dynamic_range_db) / dynamic_range_db).clamp(0.0, 1.0);
            let p16 = (norm * 65535.0).round() as u16;

            row_bytes.push((p16 >> 8) as u8);
            row_bytes.push((p16 & 0xFF) as u8);
        }
        writer.write_all(&row_bytes)?;
    }

    writer.flush()?;
    Ok(())
}
