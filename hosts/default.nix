{ pkgs
, home-manager
, user
, lib
, ... 
}:

let
  nixosModule = home: home-manager.nixosModules.home-manager {
    home-manager.extraSpecialArgs = {
      inherit pkgs;
    };

    home-manager.users.${user} = { config, lib, pkgs, ... }: {
      imports = [
        ./home.nix
        home
      ];
    };
  };

in {
  desktop = {
    config = lib.mkMerge [ nixosModule ./desktop/home.nix ];
  };

  laptop = {
    config = lib.mkMerge [ nixosModule ./laptop/home.nix ];
  };

  vbox = {
    config = lib.mkMerge [ nixosModule ./vbox/home.nix ];
  };
}
