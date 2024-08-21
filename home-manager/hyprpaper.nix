{ config, pkgs, ... }:
  
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "~/nix/wallpapers/wallhaven-85wjry.png"
      ];
      wallpaper = [
        "eDP-1,~/nix/wallpapers/wallhaven-85wjry.png"
      ];
    };
  };
}
