{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    anki
    # authy
    cargo
    chafa
    clang
    cmake
    du-dust
    efibootmgr
    fractal
    freetype
    fzf
    gcc
    libsForQt5.dolphin
    ninja
    nix-output-monitor
    nvd
    rustup
    sqlite
    sqlitebrowser
    udiskie
    unzip
    usbutils
    vlc
    vim
    wget
    wineWowPackages.stable
    winetricks
    xdg-desktop-portal-gtk
    zip
  ];
}
