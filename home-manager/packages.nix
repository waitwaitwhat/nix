{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    calibre
    carapace
    dotnetCorePackages.dotnet_9.runtime
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
    parsec-bin
    prismlauncher
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
      withOpenASAR = true;
    })
    vesktop
    vlc
    vscode
    vulnix
    wezterm
    # wireshark
    wl-clipboard
    yt-dlp
    yubioath-flutter
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];
}
