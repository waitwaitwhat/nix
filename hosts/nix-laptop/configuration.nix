{ config, pkgs, inputs, lib, self, ... }:

{
  imports =
    [
      ../../modules/bootloader.nix
      ../../modules/cosmic.nix
      ../../modules/font.nix
      ../../modules/hardware.nix
      ./hardware-configuration.nix
      "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
      ./disk-config.nix
      ../../modules/network.nix
      ../../modules/pipewire.nix
      ../../modules/program.nix
      ../../modules/virtualisation.nix
      ../../modules/security.nix
      ../../modules/services.nix
      ../../modules/system.nix
      ../../modules/user.nix
  ];
}
