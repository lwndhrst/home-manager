{ pkgs, user, ... }:

let
  modules  = import ../modules;

in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = with modules; [
    flameshot
    fzf
    gtk 
    kitty
    neovim
    picom
    rofi
    zathura
    zotero
    zsh
  ];

  # For some reason home-manager systray services depend on tray.target
  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };

  services = {
    # Network Manager systray
    network-manager-applet.enable = true;
  };

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # Term Utils
      htop              # System Resources
      customPkgs.nitch  # System Info Fetcher
      ripgrep           # Grep but Rust
      fd                # Alternative find
      xclip             # Access X clipboard from terminal
      mons              # 2-Monitor Setup Script
      acpi              # Battery Status Fetcher
      libqalculate      # Calculator/Equation Solver CLI (qalc)

      # Image/Video/Audio
      feh               # Raster-Image Viewer
      librsvg           # SVG Conversion Utility
      vlc

      # File Management
      unzip
      ranger            # Terminal File Manager

      # Apps
      firefox           # Browser
      gimp

      # Dev stuff
      gh                # GitHub CLI
      tree-sitter
      stylua
      openvpn
      nil               # Nix Language Server

      # Misc
      dconf
    ];

    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    sessionVariables = { };

    stateVersion = "22.11";
  };
}
