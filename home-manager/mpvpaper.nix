{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mpvpaper
  ];
}
