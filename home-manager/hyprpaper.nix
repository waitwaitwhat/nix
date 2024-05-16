{ config, pkgs, ... }:
  
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "~/flake/wallpapers/lose-control.png"
      ];
      wallpaper = [
        "eDP-1,~/flake/wallpapers/lose-control.png"
      ];
    };
  };
}
