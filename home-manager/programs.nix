{ inputs, pkgs, config, ... }:

{
  programs = {
    bat = {
      enable = true;
    };
    btop = {
      enable = true;
    };
    emacs = {
      enable = true;
      package = pkgs.emacs;  # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
      extraConfig = ''
        (setq standard-indent 2)
      '';
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

