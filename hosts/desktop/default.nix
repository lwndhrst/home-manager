{ pkgs
, ...
}:

let
  modules = import ../../modules;

in {
  imports = with modules; [
    c
    odin
    rust
    tex
    zig
  ];

  home = {
    packages = with pkgs; [
      # apps
      discord
      firefox
      gimp
      portfolio         # portfolio performance
      thunderbird       # email

      # game stuff
      lutris            # game platform (emulation, etc.)
      path-of-building
      protontricks      # winetricks wrapper for proton games
    ];
  };
}
