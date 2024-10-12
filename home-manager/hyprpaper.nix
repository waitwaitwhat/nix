{ config, pkgs, ... }:
  
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [
        "~/nix/wallpapers/91199411_p0.png"
        "~/nix/wallpapers/wallhaven-9deq28.jpg"
      ];
      wallpaper = [
        "DP-2,~/nix/wallpapers/91199411_p0.png"
        "HDMI-A-1,~/nix/wallpapers/wallhaven-9deq28.jpg"
      ];
    };
  };
}
