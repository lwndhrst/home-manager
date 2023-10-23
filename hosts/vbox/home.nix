{ pkgs, ... }:

let
  modules = import ../../modules;

in {
  imports = with modules; [ ];

  services = { };

  home = {
    packages = with pkgs; [ ];
  };
}
