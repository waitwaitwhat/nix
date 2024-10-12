{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    anki
    # authy
    cargo
    chafa
    clang
    cmake
    coreutils
    du-dust
    efibootmgr
    fd
    fractal
    freetype
    fzf
    gcc
    git
    # gdb
    # gf
    iaito
    libsForQt5.dolphin
    llvm_18
    mangohud
    ninja
    nix-output-monitor
    nvd
    radare2
    ripgrep
    rustup
    steamPackages.steam-runtime
    sqlite
    sqlitebrowser
    udiskie
    unzip
    usbutils
    vlc
    vim
    vulkan-tools
    wget
    wineWowPackages.stable
    winetricks
    wireshark
    wireshark-cli
    xdg-desktop-portal-gtk
    zip
  ];
}
