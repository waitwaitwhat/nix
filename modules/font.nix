{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.iosevka
    amiri
  ];
} 
