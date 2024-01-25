{ config, pkgs, ... }:

{
  font.packages = with pkgs; = [
    font-awesome
    (nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];
}
