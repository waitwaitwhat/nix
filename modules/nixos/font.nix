{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];
} 
