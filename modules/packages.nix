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
    gdb
    gf
    libsForQt5.dolphin
    llvm_18
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
    wireshark
    wireshark-cli
    xdg-desktop-portal-gtk
    zip
  ];
}
