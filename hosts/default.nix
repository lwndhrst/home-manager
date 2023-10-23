{
  desktop = [
    (import ./home.nix)
    (import ./desktop/home.nix)
  ];

  laptop = [
    (import ./home.nix)
    (import ./laptop/home.nix)
  ];

  vbox = [
    (import ./home.nix)
    (import ./vbox/home.nix)
  ];
}
