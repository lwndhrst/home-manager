{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    settings = {
      # corner-radius = 8;
      # rounded-corners-exclude = [
      #   "class_g = 'awesome'"
      # ];

      shadow = true;
      # shadow-exclude = [
      #   "class_g = 'Rofi'"
      # ];
    };
  };
}
