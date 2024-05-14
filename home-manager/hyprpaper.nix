{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";

      preload =
        [ "~/Pictures/lose-control.png" ];

      wallpaper = [
        "eDP-1,~/Pictures/lose-control.png"
      ];
    };
  };
}
