{ config, pkgs, ... }:
  
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "~/nix/wallpapers/91199411_p0.png"
      ];
      wallpaper = [
        "eDP-1,~/nix/wallpapers/91199411_p0.png"
      ];
    };
  };
}
