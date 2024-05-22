{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # authy
    btop
    cargo
    chafa
    clang
    du-dust
    efibootmgr
    fzf
    gcc
    ly
    nix-output-monitor
    nvd
    rustup
    usbutils
    vlc
    vim
    wget
  ];
}
