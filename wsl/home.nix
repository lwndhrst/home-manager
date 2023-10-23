{ pkgs
, user
, ... 
}:

let 
  modules = import ../modules;

in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = with modules; [
    c
    fzf
    neovim
    rust
    tex
    tmux
    odin
    zathura
    zsh
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      fd
      gh
      git
      htop
      libqalculate
      nil
      nitch
      openssh
      ranger
      ripgrep
      stylua
      tree-sitter
      unzip
      wget

      # LLaMA
      # llama-cpp
    ];

    sessionVariables = { };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.05";
  };
}
