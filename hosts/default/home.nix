{ config, pkgs, lib, inputs, outputs, ... }:

with import <nixpkgs> {};

{ 
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./neovim.nix 
    ./waybar.nix
  ];
  
  home.username = "w8";
  home.homeDirectory = "/home/w8";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
