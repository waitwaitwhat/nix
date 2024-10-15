{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    ags
    brightnessctl
    barrier
    du-dust
    duf
    eww
    ffmpeg
    ghidra
    grim
    keepassxc
    lutris
    ncdu
    niv
    # nix-prefetch-script
    obsidian
    obs-studio
    piper
    pass-wayland
    # parsec-bin
    python312Packages.openrazer
    sbctl
    spotify
    slack
    slurp
    thunderbird
    tor-browser-bundle-bin
    turso-cli
    (pkgs.discord-canary.override {
      withVencord = true;
      # withOpenAsar = true;
    })
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
