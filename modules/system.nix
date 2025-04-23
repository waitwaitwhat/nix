{ config, pkgs, lib, inputs, ... }:
{
  nix = {
    settings = {
      trusted-users = [ "root" "w8" ];
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
