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
    duf
    ghidra
    keepassxc
    monero-gui
    ncdu
    nix-prefetch-scripts
    obsidian
    obs-studio 
    ripgrep
    spotify
    slack
    syncthing
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
