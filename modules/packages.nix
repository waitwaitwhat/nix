{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # authy
    cargo
    chafa
    clang
    du-dust
    efibootmgr
    fzf
    gcc
    nix-output-monitor
    nvd
    rustup
    sqlite
    sqlitebrowser
    usbutils
    vlc
    vim
    wget
  ];
}
