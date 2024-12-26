{ config, pkgs, ... }:
  
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "~/nix/wallpapers/91199411_p0.png"
        "~/nix/wallpapers/wallhaven-9deq28.jpg"
        "~/nix/wallpapers/wallhaven-gp6zjl.jpg"
      ];
      wallpaper = [
        "DP-2,~/nix/wallpapers/91199411_p0.png"
        "HDMI-A-3,~/nix/wallpapers/wallhaven-9deq28.jpg"
        "DVI-D-1,~/nix/wallpapers/wallhaven-gp6zjl.jpg"
      ];
    };
  };
}
