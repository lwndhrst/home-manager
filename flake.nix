{
  description = "WSL Home Manager configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-neovim-plugins = {
      url = "github:NixNeovim/NixNeovimPlugins";
    };

    custom-nixpkgs = {
      url = "github:lwndhrst/custom-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llama-cpp = {
      url = "github:ggerganov/llama.cpp";
    };
  };

  outputs = { nixpkgs, home-manager, nix-neovim-plugins, custom-nixpkgs, llama-cpp, ... }:
    let
      user = "leon";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          nix-neovim-plugins.overlays.default
          custom-nixpkgs.overlays.default

          (super: self: {
            llama-cpp = llama-cpp.packages.${system}.default;
          })
        ];
      };

    in {
      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit user; };
        modules = [ ./wsl/home.nix ];
      };

      nixosModules = import ./hosts;
    };
}
