_: {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    bind = [
      "$mainMod, A, exec, alacritty"
      "$mainMod, D, exec, discord"
      "$mainMod, C, killactive,"
      "$mainMod, E, exec, cosmic-files"
      "$mainMod, F, exec, firefox"
      "$mainMod, G, exec, grim"
      "$mainMod, J, togglesplit,"
      "$mainMod, M, exit,"
      "$mainMod, P, pseudo,"
      "SUPER, R, exec, rofi -show drun -show-icons"
      "$mainMod, T, exec, grim -g $(slurp)"
      "$mainMod, V, togglefloating,"

      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    bindle = [
      ", XF86MonBrightnessUp, exec, brillo -r 19200 -A 480"
      ", XF86MonBrightnessDown, exec, brillo -r 19200 -U 480"
    ];
    bindr = [
      # "SUPER, SUPER_L, R, exec, pkill rofi | rofi -show drun -show-icons"
    ];
  };
}
