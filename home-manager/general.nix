{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "DP-2, 1920x1080@240, 0x0, 1"
        "HDMI-A-1, 1600x900@60, 1920x0, 1"
        "DVI-D-1, 1680x1050@60, 3520x0, 1, transform, 1"
      ];
      exec-once = [
        # "waybar"
        "/home/w8/nix/home-manager/eww/config/scripts/master.sh"
        "wl-clipboard"
       "hyprpaper"
        "firefox"
        "udiskie"
        "xrandr --output DP-2 --primary"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = "-0.5";
        force_no_accel = true;
      };
      general = {
        allow_tearing = true;
        gaps_in = 10;
        gaps_out = 20;
        border_size = 4;
        "col.active_border" = "rgb(7dcfff) rgb(c0caf5)";
        "col.inactive_border" = "rgb(24283b)";

        layout = "dwindle";
      };
      decoration = {
        rounding = 12;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
        };
        inactive_opacity = 1.0;
        active_opacity = 1.0;
        fullscreen_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 60;
        shadow_offset = "0 5";
        shadow_render_power = 4;
        "col.shadow" = "rgba(00000099)";
      };
      animations = {
        enabled = true;
        bezier = [
          "fastBezier, 0.05, 1.1, 0.2, 1.0"
          "linear, 0.0, 0.0, 1.0, 1.0"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 7, fastBezier, slide"
          "windowsOut, 1, 7, fastBezier, slide"
          "border, 1, 10, fastBezier"
          "fade, 1, 7, fastBezier"
          "workspaces, 1, 6, fastBezier"
          "border, 1, 1, liner"
          "borderangle, 1, 40, liner, loop"
          "borderangle, 1, 100, linear, loop"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      #master = {
      #  new_is_master = true;
      #};
      gestures = {
        workspace_swipe = false;
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = "-0.5";
      };
      misc = { disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = false;
      };
    };
    extraConfig = ''
      bind =, Print, exec, grim -g "$(slurp)" - | satty -f - --fullscreen --output-filename ~/Pictures/screenshots/$(date '+%Y%m%d-%H:%M:%S').png
      windowrulev2 = immediate, class:^(cs2)$
    '';
  };
}
