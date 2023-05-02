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

      set -g status-bg "#0c0b11"
      set -g status-fg "#e0def4"
    '';
  };
}
