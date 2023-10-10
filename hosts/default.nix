{ home-manager
, pkgs
, user
, ... 
}:

let
  nixosModule = { home }: home-manager.nixosModules.home-manager {
    home-manager.extraSpecialArgs = {
      inherit pkgs;
    };

    home-manager.users.${user} = { pkgs, ... }: {
      imports = [
        ./shared.nix
        home
      ];
    };
  };

in {
  desktop = nixosModule {
    home = ./desktop;
  };

  laptop = nixosModule {
    home = ./laptop;
  };

  vbox = nixosModule {
    home = ./vbox;
  };

  wsl = ./wsl;
}
