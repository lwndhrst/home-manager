{ home-manager
, config
, lib
, pkgs
, user
, ... 
}:

let
  nixosModule = { config, lib, pkgs, home }: home-manager.nixosModules.home-manager {
    home-manager.extraSpecialArgs = {
      inherit pkgs;
    };

    home-manager.users.${user} = { config, lib, pkgs, ... }: {
      imports = [
        ./shared.nix
        home
      ];
    };
  };

in {
  desktop = nixosModule {
    inherit config lib pkgs;
    home = ./desktop;
  };

  laptop = nixosModule {
    inherit config lib pkgs;
    home = ./laptop;
  };

  vbox = nixosModule {
    inherit config lib pkgs;
    home = ./vbox;
  };

  wsl = nixosModule {
    inherit config lib pkgs;
    home = ./wsl;
  };
}
