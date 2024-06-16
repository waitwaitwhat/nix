{ inputs, config, pkgs, ... }:

{
  imports = [
    ./binds.nix
    ./general.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
  };
}
