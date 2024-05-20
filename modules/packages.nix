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
    nix-output-monitor
    nvd
    usbutils
    vlc
    vim
    wget
  ];
}
