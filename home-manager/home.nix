{ config, pkgs, lib, inputs, outputs, ... }:

{ 
  imports = [
    ./alacritty.nix
    ./fastfetch.nix
    ./firefox.nix
    ./git.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./neovim.nix 
    ./nushell.nix
    ./programs.nix
    ./rofi.nix
    ./starship.nix
    ./waybar.nix
    ./zsh.nix
  ];
  
  home.username = "w8";
  home.homeDirectory = "/home/w8";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
        "betterttv"
      ];
    };
  };
  
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brightnessctl
    duf
    ffmpeg
    ghidra
    grim
    keepassxc
    monero-gui
    ncdu
    niv
    nix-prefetch-scripts
    obsidian
    obs-studio
    piper
    pass-wayland
    parsec-bin
    ripgrep
    sbctl
    spotify
    slack
    syncthing
    thunderbird
    tor-browser-bundle-bin
    turso-cli
    (discord.override {withVencord = true;})
    vesktop
    vlc
    vulnix
    yt-dlp
  ];

  home.file = {
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;
}
