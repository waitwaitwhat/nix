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
    obsidian
    obs-studio 
    ripgrep
    syncthing
    ncdu
    yt-dlp
    duf
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
