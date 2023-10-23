{ home-manager, user }:

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

in {
  homeConfigurations = {
  };

  nixosModules = {
    desktop = nixosModule ./desktop/home.nix;
    laptop = nixosModule ./laptop/home.nix;
    vbox = nixosModule ./vbox/home.nix;
  };
}
