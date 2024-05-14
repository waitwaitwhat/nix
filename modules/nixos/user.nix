{ config, pkgs, ... }:

{
  users.users.w8 = {
    isNormalUser = true;
    description = "w8";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "ratbagd" ];
    packages = with pkgs; [
      alacritty
      btop
      brightnessctl
      fastfetch
      ffmpeg
      grim
      hyprpaper
      niv
      piper
      pass-wayland
      parsec-bin
      sbctl
      thunderbird
      tor-browser-bundle-bin
      turso-cli
      (discord.override {
        withVencord = true;
      })
      vesktop
      wofi
    ];
  };
}
