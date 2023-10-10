{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (zotero.overrideAttrs (p: rec {
      # override zotero desktop file to use default light theme
      desktopItem = p.desktopItem.override (d: {
        exec = "env GTK_THEME=Default ${d.exec}";
      });

      # update install phase to use the new desktop file
      installPhase = builtins.replaceStrings [ "${p.desktopItem}" ] [ "${desktopItem}" ] p.installPhase;
    }))
  ];
}
