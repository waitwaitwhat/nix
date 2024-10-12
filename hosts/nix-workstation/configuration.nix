{ config, pkgs, inputs, lib, self, ... }:

{
  imports =
    [
      ../../modules/aagl.nix
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
  
  boot.supportedFilesystems = [ "ntfs" ];
  
  fileSystems = {
    "/home/w8/windows" = { 
      device = "UUID=FE5ABAA35ABA57DB"; 
      fsType = "lowntfs-3g"; 
      options = [ "rw" "user" "exec" "umask=000" ]; 
      noCheck = true;
    };
    "/home/w8/nvme" = { 
      device = "/dev/disk/by-uuid/242c5a63-e4e1-4c31-8a5d-a833d548743e"; 
      fsType = "ext4";
      options = [ "user" ];
      noCheck = false;
    };
    "/home/w8/hd" = { 
      device = "UUID=D8A67C98A67C7938"; 
      fsType = "lowntfs-3g"; 
      options = [ "rw" "user" "exec" "umask=000" ]; 
      noCheck = true;
    };
  };

  networking.hostName = "nix-workstation";

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
