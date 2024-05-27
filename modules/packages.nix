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
    libsForQt5.dolphin
    nix-output-monitor
    nvd
    rustup
    sqlite
    sqlitebrowser
    unzip
    usbutils
    vlc
    vim
    wget
    wineWowPackages.stable
    winetricks
    zip
  ];
}
