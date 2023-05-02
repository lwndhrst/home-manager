{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Alternative TeX Engine
    # tectonic

    texlive.combined.scheme-full
    latexrun

    # TeX LSP
    texlab
  ];
}
