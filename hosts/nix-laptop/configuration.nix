{ config, pkgs, inputs, lib, self, ... }:

{
  imports =
    [
      ../../modules/bootloader.nix
      ../../modules/cosmic.nix
      ../../modules/font.nix
      # ../../modules/greetd.nix
      ../../modules/hardware.nix
      ./hardware-configuration.nix
      ./disk-config.nix
      ../../modules/japanese.nix
      ../../modules/network.nix
      ../../modules/packages.nix
      ../../modules/pipewire.nix
      ../../modules/program.nix
      ../../modules/virtualisation.nix
      ../../modules/security.nix
      ../../modules/services.nix
      ../../modules/system.nix
      ../../modules/user.nix
  ];
  networking.hostName = "nix-laptop";
}
