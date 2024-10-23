{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # anki
    # authy
    cargo
    chafa
    clang
    cmake
    coreutils
    dmidecode
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
    # libsForQt5.qt5ct
    # libsForQt5.dolphin
    # libsForQt5.qtstyleplugin-kvantum
    llvm_18
    mangohud
    ninja
    nix-output-monitor
    nvd
    python312Packages.openrazer
    radare2
    remmina
    ripgrep
    rustup
    # steamPackages.steam-runtime
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
