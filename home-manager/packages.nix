{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    barrier
    du-dust
    duf
    eww
    ffmpeg
    ghidra
    grim
    keepassxc
    ncdu
    niv
    # nix-prefetch-script
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
    (pkgs.discord.override {withVencord = true;})
    vesktop
    vlc
    vscodium
    vulnix
    # wireshark
    wl-clipboard
    wootility
    yt-dlp
    yubioath-flutter
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];
}
