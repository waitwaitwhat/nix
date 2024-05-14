{ config, pkgs, .. }:

{
  environment.systemPackages = with pkgs; [
    authy
    efibootmgr
    usbutils
    wget
    btop
    vlc
    vim
  ];
}
