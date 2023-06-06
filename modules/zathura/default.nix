{ pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";
    };

    extraConfig = ''
      # https://github.com/rose-pine/rose-pine-theme
      # Soho vibes for Zathura: Rosé Pine
      #
      # Usage:
      # Copy contents of this file to ~/.config/zathura/zathurarc
      #
      # Change 'recolor' and 'recolor-keephue' to true to change
      # the document colors for a more uniform viewing experience.
      
      # set default-bg                  "#191724"
      set default-bg                  "#0c0b11"
      set default-fg                  "#e0def4"
      
      # set statusbar-bg                "#555169"
      set statusbar-bg                "#1f1d2e"
      set statusbar-fg                "#e0def4"
      
      # set inputbar-bg                 "#6e6a86"
      set inputbar-bg                 "#1f1d2e"
      set inputbar-fg                 "#ebbcba"
      
      set notification-bg             "#e0def4"
      set notification-fg             "#555169"
      
      set notification-error-bg       "#f6c177"
      set notification-error-fg       "#555169"
      
      set notification-warning-bg     "#ebbcba"
      set notification-warning-fg     "#555169"
      
      set highlight-color             "#ebbcba"
      set highlight-active-color      "#eb6f92"
      
      # set completion-bg               "#6e6a86"
      set completion-bg               "#1f1d2e"
      set completion-fg               "#ebbcba"
      
      set completion-highlight-bg     "#ebbcba"
      set completion-highlight-fg     "#26233a"
      
      set recolor-lightcolor          "#191724"
      set recolor-darkcolor           "#e0def4"
      
      set recolor                     "true"
      set recolor-keephue             "false"
    '';
  };
}
