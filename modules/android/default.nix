{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [ android-studio ];

    file.".ideavimrc".text = ''
      set relativenumber
      set number
      set visualbell
      set noerrorbells
    '';
  };
}
