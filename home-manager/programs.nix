{ inputs, pkgs, config, ... }:

{
  programs = {
    bat = {
      enable = true;
    };
    btop = {
      enable = true;
    };
    hyprcursor-phinger.enable = true;
  };

  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}

