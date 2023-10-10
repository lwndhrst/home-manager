{ pkgs
, ...
}:

let
  modules = import ../modules;

in {
  modules = with modules; [
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
      # term utils
      acpi
      customPkgs.nitch
      fd
      htop
      libqalculate
      mons
      ripgrep
      xclip

      # image/audio/video
      feh
      librsvg
      pavucontrol       # pulse audio volume controle
      pamixer           # pulse audio mixer cli

      # file system
      unzip
      ranger

      # random dev stuff
      gh
      nil
      stylua
      tree-sitter

      # misc
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
