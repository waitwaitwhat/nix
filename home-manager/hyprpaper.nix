{ config, pkgs, ... }:
  
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "~/flake/wallpapers/kazusa+senseicomfy.jpg"
      ];
      wallpaper = [
        "eDP-1,~/flake/wallpapers/kazusa+senseicomfy.jpg"
      ];
    };
  };
}
