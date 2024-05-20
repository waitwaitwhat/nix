{ config, pkgs, .. }:

{
  environment.systemPackages = with pkgs; [
    authy
    btop
    chafa
    efibootmgr
    fzf
    hyprpaper
    nh
    usbutils
    vlc
    vim
    wget
  ];
}
