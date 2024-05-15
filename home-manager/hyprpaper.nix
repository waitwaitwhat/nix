{ config, pkgs, ... }:
  
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preloads = [
        "../../wallpapers/lose-control.png"
      ];
      wallpapers = [
        "eDP-1,../../wallpapers/lose-control.png"
      ];
    };
  };
}
