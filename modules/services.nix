{ config, pkgs, ... }:

{
  imports = [
    ./services/avahi.nix
    ./services/openssh.nix
    ./services/printing.nix
    ./services/xserver.nix
  ];
}
