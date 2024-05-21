{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # authy
    btop
    cargo
    chafa
    clang
    efibootmgr
    fzf
    gcc
    nix-output-monitor
    nvd
    rustup
    usbutils
    vlc
    vim
    wget
  ];
}
