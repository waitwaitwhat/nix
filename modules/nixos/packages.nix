{ config, pkgs, .. }:

{
  environment.systemPackages = with pkgs; [
    authy
    btop
    efibootmgr
    fzf
    usbutils
    vlc
    vim
    wget
  ];
}
