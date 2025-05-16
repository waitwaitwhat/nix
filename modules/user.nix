{ config, pkgs, ... }:

{
  users.users.w8 = {
    initialPassword = "password123";
    isNormalUser = true;
    description = "w8";
    shell = pkgs.zsh;
    extraGroups = [ "inputs" "input" "audio" "video" "networkmanager" "network" "wheel" "libvirtd" "ratbagd" "wireshark" ];
  };
}
