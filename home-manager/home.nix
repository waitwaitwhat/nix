{ config, pkgs, lib, inputs, outputs, ... }:

{ 
  imports = [
    # ./alacritty.nix
    # ./emacs
    ./eww/default.nix
    ./fastfetch.nix
    ./firefox.nix
    ./git.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./kitty.nix
    # ./mpvpaper.nix
    ./neovim.nix 
    ./nushell.nix
    ./packages.nix
    ./programs.nix
    ./rofi.nix
    ./starship.nix
    # ./waybar.nix
    ./wezterm.nix
    ./zsh.nix
  ];
  
  home.username = "w8";
  home.homeDirectory = "/home/w8";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  
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
    # WLR_NO_HARDWARE_CURSORS = "1";
    # NIXOS_OZONE_WL = "1";
  };

  programs.home-manager.enable = true;
}
