{ config, pkgs, ... }:

{
  users.users.w8 = {
    isNormalUser = true;
    description = "w8";
    shell = pkgs.zsh;
    extraGroups = [ "inputs" "audio" "video" "networkmanager" "network" "wheel" "libvirtd" "ratbagd" "wireshark" ];
  };
}
