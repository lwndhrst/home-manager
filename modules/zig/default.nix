{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Zig Language and Toolchain
    zig

    # Zig LSP
    zls
  ];
}
