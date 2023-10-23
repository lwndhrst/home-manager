{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ ];
    };

    envExtra = ''
      # Add nix packages to PATH, only relevant for non-NixOS systems
      export PATH=$PATH:~/.nix-profile/bin
    '';

    initExtra = ''
      # Starship Prompt
      export STARSHIP_CONFIG=~/.config/starship/starship.toml
      eval "$(${pkgs.starship}/bin/starship init zsh)"

      fzf-cd() {
        DIR=$(${pkgs.fd}/bin/fd --type directory | ${pkgs.fzf}/bin/fzf)
        if [[ $DIR && -d $DIR ]]; then
          cd $DIR
        fi
      }

      fzf-edit() {
        FILE=$(${pkgs.fd}/bin/fd --type file | ${pkgs.fzf}/bin/fzf)
        if [[ $FILE && -f $FILE ]]; then
          $EDITOR $FILE
        fi
      }
    '';

    shellAliases = {
      fcd = "fzf-cd";
      fe = "fzf-edit";
    };
  };

  # Starship prompt config
  home.file.".config/starship/starship.toml" = {
    source = ./starship.toml;
  };
}
