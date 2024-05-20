{ config, pkgs, .. }:

{
  environment.systemPackages = with pkgs; [
    authy
    btop
    cargo
    chafa
    efibootmgr
    fzf
    hyprpaper
    nix-output-monitor
    nvd
    rustup
    usbutils
    vlc
    vim
    wget
  ];
}
