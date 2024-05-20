{ config, pkgs, .. }:

{
  environment.systemPackages = with pkgs; [
    authy
    btop
    chafa
    efibootmgr
    fzf
    hyprpaper
    ly
    nh
    usbutils
    vlc
    vim
    wget
  ];
}
