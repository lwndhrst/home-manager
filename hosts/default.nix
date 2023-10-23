{ home-manager, user }:

let 
  nixosModule = home: { config, pkgs, lib, ... }: {
    config = home-manager.nixosModules.home-manager {
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
  };

in {
  desktop = nixosModule ./desktop/home.nix;
  laptop = nixosModule ./laptop/home.nix;
  vbox = nixosModule ./vbox/home.nix;
}
