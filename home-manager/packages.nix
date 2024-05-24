{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    du-dust
    duf
    ffmpeg
    ghidra
    grim
    keepassxc
    ncdu
    niv
    nix-prefetch-script
    obsidian
    obs-studio
    piper
    pass-wayland
    parsec-bin
    ripgrep
    sbctl
    spotify
    slack
    slurp
    thunderbird
    tor-browser-bundle-bin
    turso-cli
    (discord.override {withVencord = true;})
    vesktop
    vlc
    vulnix
    yt-dlp
  ];
}
