{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    mouse = true;
    escapeTime = 10;
    terminal = "screen-256color";
    extraConfig = ''
      # required for neovim to display correct colors inside tmux
      set-option -ga terminal-overrides ",*256col*:Tc"
    '';
  };
}
