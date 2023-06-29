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
  };

  outputs = { nixpkgs, home-manager, nix-neovim-plugins, ... }:
    let
      user = "leon";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
	overlays = [
	  nix-neovim-plugins.overlays.default
	];
      };

    in {
      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

	extraSpecialArgs = { inherit user; };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
