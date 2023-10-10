{ pkgs }:

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
}
