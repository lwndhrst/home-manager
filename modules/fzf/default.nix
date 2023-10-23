{ pkgs, ... }:

let
  fzf-cd = pkgs.writeShellScriptBin "fcd" ''
    #!${pkgs.bash}/bin/bash
    DIR=$(${pkgs.fd}/bin/fd --type directory | ${pkgs.fzf}/bin/fzf)
    if [[ $DIR && -d $DIR ]]; then
      cd $DIR
    fi
  '';
  fzf-edit = pkgs.writeShellScriptBin "fe" ''
    #!${pkgs.bash}/bin/bash
    FILE=$(${pkgs.fd}/bin/fd --type file | ${pkgs.fzf}/bin/fzf)
    if [[ $FILE && -f $FILE ]]; then
      $EDITOR $FILE
    fi
  '';

in {
  home.packages = [
    fzf-cd   # fcd
    fzf-edit # fe
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = { 
      "fg"        = "#908caa";
      "bg"        = "#0c0b11";
      "hl"        = "#ebbcba";
      "fg+"       = "#e0def4";
      "bg+"       = "#26233a";
      "hl+"       = "#ebbcba";
      "border"    = "#403d52";
      "header"    = "#31748f";
      "gutter"    = "#0c0b11";
      "spinner"   = "#f6c177";
      "info"      = "#9ccfd8";
      "separator" = "#403d52";
      "pointer"   = "#c4a7e7";
      "marker"    = "#eb6f92";
      "prompt"    = "#908caa";
    };
  };
}
