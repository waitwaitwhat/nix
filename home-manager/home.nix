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
    ./kitty.nix
    ./neovim.nix 
    ./nushell.nix
    ./packages.nix
    ./programs.nix
    ./rofi.nix
    ./starship.nix
    ./waybar.nix
    ./zsh.nix
    ./eww/eww.nix
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
  
  home.file = {
  };

  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;
}
