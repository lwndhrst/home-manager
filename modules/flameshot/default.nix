{ pkgs, ... }:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        buttons = ''
          @Variant(\0\0\0\x7f\0\0\0\vQList<int>\0\0\0\0\n\0\0\0\0\0\0\0\xf\0\0\0\b\0\0\0\t\0\0\0\x10\0\0\0\n\0\0\0\v\0\0\0\x17\0\0\0\f\0\0\0\x11)
        '';
        contrastUiColor = "#0c0b11";
        uiColor = "#9ccfd8";
      };
    };
  };
}
