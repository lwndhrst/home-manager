{ pkgs, ... }:

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

  services = {
    # PulseAudio systray
    pasystray.enable = true;
  };

  home = {
    packages = with pkgs; [
      # Video/Audio
      pavucontrol       # PulseAudio Settings
      pamixer           # PulseAudio Mixer CLI

      # Apps
      discord
      # zoom-us           # Video Conferencing
      portfolio         # Portfolio Performance
      thunderbird       # Email
      lutris            # Game Platform (Emulation, etc.)
      protontricks      # Winetricks wrapper for proton games

      # customPkgs.path-of-building
      path-of-building
    ];
  };
}
