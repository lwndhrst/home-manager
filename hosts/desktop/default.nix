{ pkgs }:

let
  modules = import ../../modules;
  shared = import ../shared.nix { inherit pkgs; };

in {
  imports = with modules; [
    c
    odin
    rust
    tex
    zig
  ] ++ (
    shared.modules
  );

  systemd.user.targets.tray = {
    Unit = {
      Description = "System Tray Service for Home Manager";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  services = {
    # network manager systray
    network-manager-applet.enable = true;

    # pulse audio systray
    pasystray.enable = true;
  };

  home = {
    packages = with pkgs; [
      # video/audio
      pavucontrol       # pulse audio volume controle
      pamixer           # pulse audio mixer cli

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
    ] ++ (
      shared.packages
    );
  };
}
