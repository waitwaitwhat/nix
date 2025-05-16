{ config, pkgs, inputs, lib, self, ... }:

{
  imports =
    [
      # ../../modules/aagl.nix
      ../../modules/bootloader.nix
      # ../../modules/cosmic.nix
      ../../modules/font.nix
      # ../../modules/gpupassthrough.nix
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
      # ../../modules/specialisation.nix
      ../../modules/system.nix
      ../../modules/user.nix
      inputs.nix-minecraft.nixosModules.minecraft-servers
  ];
  
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  boot.supportedFilesystems = [ "ntfs" ];
  
  fileSystems = {
    # "/home/w8/windows" = { 
      # device = "UUID=FE5ABAA35ABA57DB"; 
      # fsType = "lowntfs-3g"; 
      # options = [ "rw" "user" "exec" "umask=000" ]; 
      # noCheck = true;
    # };
    # "/home/w8/hd" = { 
      # device = "UUID=D8A67C98A67C7938"; 
      # fsType = "lowntfs-3g"; 
      # options = [ "rw" "user" "exec" "umask=000" ]; 
      # noCheck = true;
    # };
    "/home/w8/steam" = 
    { device = "/dev/disk/by-uuid/49543e1a-17cb-4d8d-bf48-b320f3bec2ef";
      fsType = "btrfs";
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
