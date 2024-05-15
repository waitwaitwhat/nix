{ config, pkgs, .. }:

{
  environment.systemPackages = with pkgs; [
    authy
    btop
    efibootmgr
    fzf
    hyprpaper
    usbutils
    vlc
    vim
    wget
  ];
}
