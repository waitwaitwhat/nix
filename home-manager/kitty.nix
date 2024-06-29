{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      background_opacity = "0.6";
      bold_font = "auto";
      bold_italic_font = "auto";
      font_family = "Iosevka Nerd Font";
      font_size = "11";
      italic_font = "auto";
      window_padding_width = "3";
      window_padding_height = "3";
    };
  };
}
