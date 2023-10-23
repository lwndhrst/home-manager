{ pkgs, ... }:

{
  home.packages = with pkgs; [ rofi-power-menu ];

  programs = {
    rofi = {
      enable = true;
      font = "Cascadia Mono 14";
      terminal = "${pkgs.kitty}/bin/kitty";
      theme = "~/.config/rofi/theme.rasi";
    };
  };

  home.file.".config/rofi/theme.rasi".text = ''
    /*******************************************************************************
     * ROUNDED THEME FOR ROFI 
     * User                 : LR-Tech               
     * Theme Repo           : https://github.com/lr-tech/rofi-themes-collection
     *******************************************************************************/

    * {
        bg0:    #0c0b11;
        bg1:    #0c0b11;
        bg2:    #31748f;
        bg3:    #9ccfd8;
        fg0:    #908caa;
        fg1:    #e0def4;
        fg2:    #908caa;
        fg3:    #6e6a86;
    }

    @import "rounded-common.rasi"

    window {
        // border-radius: 12px;
        border-radius: 0px;
    }

    inputbar, message, element {
        // border-radius: 6px;
        border-radius: 0px;
    }

    element selected {
        text-color: @bg1;
    }
  '';

  home.file.".config/rofi/rounded-common.rasi".text = ''
    /*******************************************************************************
     * ROUNDED THEME FOR ROFI 
     * User                 : LR-Tech               
     * Theme Repo           : https://github.com/lr-tech/rofi-themes-collection
     *******************************************************************************/

    * {
        background-color:   transparent;
        text-color:         @fg0;

        margin:     0px;
        padding:    0px;
        spacing:    0px;
    }

    window {
        location:       center;
        width:          480;
        border-radius:  24px;
        
        background-color:   @bg0;
    }

    mainbox {
        padding:    12px;
    }

    inputbar {
        background-color:   @bg1;
        border-color:       @bg3;

        border:         2px;
        border-radius:  16px;

        padding:    8px 16px;
        spacing:    8px;
        children:   [ prompt, entry ];
    }

    prompt {
        text-color: @fg2;
    }

    entry {
        placeholder:        "Search";
        placeholder-color:  @fg3;
    }

    message {
        margin:             12px 0 0;
        border-radius:      16px;
        border-color:       @bg2;
        background-color:   @bg2;
    }

    textbox {
        padding:    8px 24px;
    }

    listview {
        background-color:   transparent;

        margin:     12px 0 0;
        lines:      8;
        columns:    1;

        fixed-height: false;
    }

    element {
        padding:        8px 16px;
        spacing:        8px;
        border-radius:  16px;
    }

    element normal active {
        text-color: @bg3;
    }

    element selected normal, element selected active {
        background-color:   @bg3;
    }

    element-icon {
        size:           1em;
        vertical-align: 0.5;
    }

    element-text {
        text-color: inherit;
    }
  '';
}
