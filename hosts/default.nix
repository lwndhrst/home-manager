{ pkgs
, home-manager
, user
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
    config = nixosModule ./desktop/home.nix;
  };

  laptop = {
    config = nixosModule ./laptop/home.nix;
  };

  vbox = {
    config = nixosModule ./vbox/home.nix;
  };
}
