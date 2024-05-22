{ pkgs, ... }:
{
  boot = {
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    bootspec.enable = true;
    plymouth.enable = true;
  };
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';
}
