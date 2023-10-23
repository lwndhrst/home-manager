{ pkgs
, home-manager
, user
}:

let
  nixosModule = home: { config, pkgs, lib, ... }: {
    imports = [
      home-manager.nixosModules.home-manager {
        home-manager.extraSpecialArgs = {
          inherit pkgs;
        };

        home-manager.users.${user} = { config, pkgs, lib, ... }: {
          imports = [
            ./home.nix
            home
          ];
        };
      }
    ];
  };

  homeConfiguration = home: home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = { inherit user; };
    modules = [
      ./home.nix
      home
    ];
  };

in {
  homeConfigurations = {
    desktop = homeConfiguration ./desktop/home.nix;
    laptop = homeConfiguration ./laptop/home.nix;
    vbox = homeConfiguration ./vbox/home.nix;

    wsl = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit user; };
      modules = [ ../wsl/home.nix ];
    };
  };

  nixosModules = {
    desktop = nixosModule ./desktop/home.nix;
    laptop = nixosModule ./laptop/home.nix;
    vbox = nixosModule ./vbox/home.nix;
  };
}
