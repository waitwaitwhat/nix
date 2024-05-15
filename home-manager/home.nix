{ config, pkgs, lib, inputs, outputs, ... }:

{ 
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./git.nix
    ./hyprlock.nix
    ./neovim.nix 
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
    fzf
    ghidra
    ncdu
    obsidian
    obs-studio 
    ripgrep
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
