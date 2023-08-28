{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # customPkgs.odin
    odin

    # customPkgs.ols
    ols
  ];
}
