{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  name = "rust-dev-shell";

  packages = with pkgs; [
    rustc
    cargo
    clippy
    pkg-config
  ];

  #RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

  shellHook = ''
    echo "🦀 Rust Dev Environment Loaded!"
    echo "Rustc: $(rustc --version)"
    echo "Cargo: $(cargo --version)"
  '';
}
