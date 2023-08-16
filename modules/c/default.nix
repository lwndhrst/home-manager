{ pkgs, ... }:

{
  home.packages = with pkgs; [
    llvmPackages_15.clang

    # clangd (LSP), etc.
    clang-tools_15
  ];
}
