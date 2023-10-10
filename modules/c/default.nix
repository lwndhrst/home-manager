{ pkgs, ... }:

{
  home.packages = with pkgs; [
    llvmPackages_16.clang

    # clangd (LSP), etc.
    clang-tools_16
  ];
}
