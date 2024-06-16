{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
    settings = {
      animation = import ./hyprland/animation.nix;
      bezier = import ./hyprland/bezier.nix;
      bind = import ./hyprland/bind.nix;
      bindm = import ./hyprland/bindm.nix;
      binds = import ./hyprland/binds.nix;
      decoration = import ./hyprland/decoration.nix;
      dwindle = import ./hyprland/dwindle.nix;
      exec-once = import ./hyprland/exec-once-desktop.nix;
      general = import ./hyprland/general.nix;
      input = import ./hyprland/input.nix;
      misc = import ./hyprland/misc.nix;
      windowrule = import ./hyprland/windowrule.nix;
      windowrulev2 = import ./hyprland/windowrulev2.nix;
    };
  };
}

