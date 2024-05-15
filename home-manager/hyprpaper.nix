{ config, pkgs, ... }:
  
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "../../wallpapers/lose-control.png"
      ];
      wallpaper = [
        "eDP-1,../../wallpapers/lose-control.png"
      ];
    };
  };
}
