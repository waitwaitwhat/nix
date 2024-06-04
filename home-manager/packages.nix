{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.brightnessctl
    pkgs.du-dust
    pkgs.duf
    pkgs.ffmpeg
    pkgs.ghidra
    pkgs.grim
    pkgs.keepassxc
    pkgs.ncdu
    pkgs.niv
    # pkgs.nix-prefetch-script
    pkgs.obsidian
    pkgs.obs-studio
    pkgs.piper
    pkgs.pass-wayland
    pkgs.parsec-bin
    pkgs.ripgrep
    pkgs.sbctl
    pkgs.spotify
    pkgs.slack
    pkgs.slurp
    pkgs.thunderbird
    pkgs.tor-browser-bundle-bin
    pkgs.turso-cli
    (pkgs.discord.override {withVencord = true;})
    pkgs.vesktop
    pkgs.vlc
    pkgs.vulnix
    pkgs.yt-dlp
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];
}
