{ config, pkgs, ... }:
  
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "~/flake/wallpapers/wallhaven-85wjry.png"
      ];
      wallpaper = [
        "eDP-1,~/flake/wallpapers/wallhaven-85wjry.png"
      ];
    };
  };
}
