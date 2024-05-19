{ config, pkgs, .. }:

{
  environment.systemPackages = with pkgs; [
    authy
    btop
    chafa
    efibootmgr
    fzf
    hyprpaper
    usbutils
    vlc
    vim
    wget
  ];
}
