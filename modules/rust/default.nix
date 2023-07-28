{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust Toolchain Manager
    # Install rust-analyzer via 'rustup component add rust-analyzer'
    rustup
  ];
}
