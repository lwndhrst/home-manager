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

    initExtra = ''
      # Starship Theme
      export STARSHIP_CONFIG=~/.config/starship/starship.toml
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';
  };
  
  # Starship prompt config
  home.file.".config/starship/starship.toml" = {
    source = ./starship.toml;
  };
}
