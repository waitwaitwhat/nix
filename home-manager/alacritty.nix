{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { 
          x = 10;
          y = 10;
        };
        dynamic_padding = true;
        opacity = 0.59;
      };
      font.normal = {
        family = "Iosevka Nerd Font";
        style = "Regular";
      };
    }; 
  };
}
