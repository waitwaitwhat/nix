{ config, pkgs, ... }:
let
  aagl = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "1v9jk4j0zylx3ixwk5q8z22v6ir86pk9lfbf5q3ibgaggpf8kqa7";
  });
  # Or, if you follow Nixpkgs release 24.05:
  # aagl = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/release-24.05.tar.gz");
in
{
  imports = [
    aagl.module
  ];

  nix.settings = aagl.nixConfig; # Set up Cachix
  programs.anime-game-launcher.enable = true;
  programs.anime-games-launcher.enable = true;
  # programs.anime-borb-launcher.enable = true;
  programs.honkers-railway-launcher.enable = true;
  # programs.honkers-launcher.enable = true;
  programs.wavey-launcher.enable = true;
  programs.sleepy-launcher.enable = true;
}
