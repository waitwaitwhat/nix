{ inputs, config, lib, pkgs, ... }:

{
  home.file.".config/eww" = {
    source = ./bar;
    executable = true;
    recursive = true;
  };
}
