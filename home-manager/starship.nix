{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration
    enableZshIntegration
    settings = {

    };
  };
}
