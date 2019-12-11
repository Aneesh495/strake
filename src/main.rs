//! Strake CLI Workstation.

use std::fs;
use std::path::PathBuf;
use clap::{Parser as ClapParser, Subcommand};
use colored::*;

use strake::apl::{eval_apl, Evaluator, Lexer, parser::Parser};
use strake::beamformer::das::ArrayConfig;
use strake::beamformer::pwc::compound_plane_waves;
use strake::dsp::hilbert::envelope_2d;
use strake::phantom::scatterers::{TissuePhantom, simulate_rf_plane_wave};
use strake::render::ascii::render_ascii_bmode;
use strake::render::pgm::save_pgm_16bit;
use strake::bench::run_benchmarks;

#[derive(ClapParser)]
#[command(name = "strake")]
#[command(about = "Acoustic Phased-Array Beamforming and Synthetic Aperture Workstation")]
#[command(version = "0.1.0")]
struct Cli {
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand)]
enum Commands {
    /// Execute an APL script file
    Run {
        /// Path to .apl script file
        file: PathBuf,
    },
    /// Launch interactive APL REPL session
    Repl,
    /// Execute reference ultrasound imaging pipelines
    Pipeline {
        /// Pipeline name: cardiac, vascular, convex, ndt, pwc
        #[arg(default_value = "cardiac")]
        name: String,
        /// Optional output PGM image path
        #[arg(short, long)]
        output: Option<PathBuf>,
    },
    /// Run hardware and beamforming micro-benchmarks
    Bench,
    /// Run built-in unit tests and APL verification suites
    Test,
}

fn main() {
    let cli = Cli::parse();

    match cli.command {
        Commands::Run { file } => {
            println!("{} Loading APL script: {}", "=>".cyan(), file.display());
            let content = match fs::read_to_string(&file) {
                Ok(c) => c,
                Err(e) => {
                    eprintln!("{} Failed to read file {}: {}", "ERROR:".red(), file.display(), e);
                    std::process::exit(1);
                }
            };

            match eval_apl(&content) {
                Ok(result) => {
                    println!("{} Execution completed successfully.", "SUCCESS:".green());
                    println!("Result: {}", result);
                }
                Err(err) => {
                    eprintln!("{} Evaluation error: {}", "ERROR:".red(), err);
                    std::process::exit(1);
                }
            }
        }

        Commands::Repl => {
            println!("{}", "=========================================================".cyan());
            println!("{}", "    STRAKE ARRAY PROGRAMMING REPL (ISO 13751 / Dfns)     ".bold());
            println!("{}", " Type ':q' to exit. Unicode glyphs and ASCII aliases active.".dimmed());
            println!("{}", "=========================================================".cyan());

            let mut evaluator = Evaluator::new();
            use std::io::{self, Write};

            loop {
                print!("    ");
                io::stdout().flush().unwrap();

                let mut input = String::new();
                if io::stdin().read_line(&mut input).is_err() {
                    break;
                }

                let trimmed = input.trim();
                if trimmed == ":q" || trimmed == "exit" {
                    println!("Goodbye.");
                    break;
                }
                if trimmed.is_empty() {
                    continue;
                }

                let mut lexer = Lexer::new(trimmed);
                match lexer.tokenize() {
                    Ok(tokens) => {
                        let mut parser = Parser::new(tokens);
                        match parser.parse_program() {
                            Ok(prog) => match evaluator.eval_program(&prog) {
                                Ok(res) => println!("{}", res.to_string().green()),
                                Err(e) => eprintln!("{} {}", "VALUE ERROR:".red(), e),
                            },
                            Err(e) => eprintln!("{} {}", "SYNTAX ERROR:".red(), e),
                        }
                    }
                    Err(e) => eprintln!("{} {}", "LEX ERROR:".red(), e),
                }
            }
        }

        Commands::Pipeline { name, output } => {
            run_pipeline_preset(&name, output);
        }

        Commands::Bench => {
            run_benchmarks();
        }

        Commands::Test => {
            run_all_tests();
        }
    }
}

fn run_pipeline_preset(name: &str, output: Option<PathBuf>) {
    println!("{}", format!("=> Initializing Pipeline: {}", name.to_uppercase()).bold().cyan());

    let cfg = ArrayConfig::default();
    let num_samples = 2048;

    let phantom = match name {
        "ndt" => {
            println!("Configuring NDT calibrated wire target phantom...");
            TissuePhantom::wire_target_phantom()
        }
        _ => {
            println!("Configuring anatomical cyst & inclusion tissue phantom...");
            TissuePhantom::cyst_phantom(150)
        }
    };

    println!("Simulating RF echo wavefield (64 channels x {} samples)...", num_samples);
    let angles_deg: [f64; 5] = [-6.0, -3.0, 0.0, 3.0, 6.0];
    let angles_rad: Vec<f64> = angles_deg.iter().map(|&a: &f64| a.to_radians()).collect();

    let grid_x: Vec<f64> = (0..96).map(|i| -0.012 + (i as f64) * (0.024 / 95.0)).collect();
    let grid_z: Vec<f64> = (0..96).map(|i| 0.012 + (i as f64) * (0.028 / 95.0)).collect();

    let rf_datasets: Vec<_> = angles_rad
        .iter()
        .map(|&angle| simulate_rf_plane_wave(&phantom, &cfg, num_samples, angle))
        .collect();

    println!("Executing Coherent Plane-Wave Compounding across {} steering angles...", angles_rad.len());
    let compounded_rf = compound_plane_waves(&rf_datasets, &angles_rad, &cfg, &grid_x, &grid_z);

    println!("Extracting analytic envelope and applying dynamic range compression...");
    let bmode_envelope = envelope_2d(&compounded_rf);

    let ascii_preview = render_ascii_bmode(&bmode_envelope, 50.0);
    println!("\n{}", ascii_preview);

    if let Some(out_path) = output {
        println!("Exporting 16-bit PGM raster to: {}", out_path.display());
        if let Err(e) = save_pgm_16bit(&bmode_envelope, 50.0, &out_path) {
            eprintln!("{} Failed to write PGM: {}", "ERROR:".red(), e);
        } else {
            println!("{} Image written successfully.", "SUCCESS:".green());
        }
    }
}

fn run_all_tests() {
    println!("{}", "Running Strake verification test suite...".cyan());

    // 1. Array math tests
    let code = "A ← 1 2 3 4 ⋄ B ← +/ A ⋄ B";
    let res = eval_apl(code).expect("Basic array reduction failed");
    assert_eq!(res.as_slice_f64().unwrap()[0], 10.0);
    println!(" [PASS] APL basic reduction (+/ 1 2 3 4)");

    // 2. Reshape tests
    let code = "M ← 2 3 ⍴ 1 2 3 4 5 6 ⋄ M";
    let res = eval_apl(code).expect("APL reshape failed");
    assert_eq!(res.shape, vec![2, 3]);
    println!(" [PASS] APL dyadic reshape (2 3 ⍴ 1..6)");

    // 3. Dfn tests
    let code = "F ← { ⍺ + ⍵ × 2 } ⋄ 10 F 5";
    let res = eval_apl(code).expect("APL dfn execution failed");
    assert_eq!(res.as_slice_f64().unwrap()[0], 20.0);
    println!(" [PASS] APL dyadic dfn ({{ ⍺ + ⍵ × 2 }})");

    // 4. Outer product tests
    let code = "V ← 1 2 3 ⋄ M ← V ∘.× V ⋄ M";
    let res = eval_apl(code).expect("Outer product failed");
    assert_eq!(res.shape, vec![3, 3]);
    println!(" [PASS] APL outer product (V ∘.× V)");

    println!("{}", "All test cases passed with 100% compliance.".bold().green());
}
