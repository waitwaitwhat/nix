{ config, pkgs, inputs, lib, self, ... }:

{
  imports =
    [
      ../../modules/nixos/bootloader.nix
      ../../modules/nixos/cosmic.nix
      ../../modules/nixos/font.nix
      ../../modules/nixos/hardware.nix
      ./hardware-configuration.nix
      "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
      ./disk-config.nix
      ../../modules/nixos/network.nix
      ../../modules/nixos/pipewire.nix
      ../../modules/nixos/program.nix
      ../../modules/nixos/virtualisation.nix
      ../../modules/nixos/security.nix
      ../../modules/nixos/services.nix
      ../../modules/nixos/shell.nix
      ../../modules/nixos/system.nix
      ../../modules/nixos/user.nix
  ];
}
