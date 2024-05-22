{ config, pkgs, ... }:

{
  users.users.w8 = {
    isNormalUser = true;
    description = "w8";
    shell = pkgs.nushell;
    extraGroups = [ "input" "video" "networkmanager" "wheel" "libvirtd" "ratbagd" ];
  };
}
