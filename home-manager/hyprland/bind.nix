let
  superBinds = builtins.map (x: "SUPER, " + x) [
    
    # Apps
    "Space, exec, rm -r /home/$USER/.cache/tofi* ; tofi-drun"
    "A, exec, alacritty"
    "C, killactive"
    "D, exec, discord"
    "E, exec, dolphin"
    "F, exec, firefox"
    "G, exec, grimblast --notify copysave area"
    "J, togglesplit"
    "M, exit"
    "P, pin, enable"
    "R, exec, rofi -show drun -show-icons"
    "V, togglefloating"
    # Workspaces
    "1, workspace, 1"
    "2, workspace, 2"
    "3, workspace, 3"
    "4, workspace, 4"
    "5, workspace, 5"
    "6, workspace, 6"
    "7, workspace, 7"
    "Tab, fullscreen, 0"
    "bracketleft, splitratio, -0.1"
    "bracketright, splitratio, +0.1"
    "left , movefocus, l"
    "down , movefocus, d"
    "up , movefocus, u"
    "right , movefocus, r"
    # Audio
    "F10, exec, playerctl next"
    "F8, exec, playerctl previous"
    "F9, exec, playerctl play-pause"
  ];

  superShiftBinds = builtins.map (x: "SUPER SHIFT, " + x) [
    # Super+shift binds
    "G, exec, grimblast --notify --cursor copysave output"
    "left , movewindow, l"
    "down , movewindow, d"
    "up , movewindow, u"
    "right , movewindow, r"
    "1, movetoworkspace, 1"
    "2, movetoworkspace, 2"
    "3, movetoworkspace, 3"
    "4, movetoworkspace, 4"
    "5, movetoworkspace, 5"
    "6, movetoworkspace, 6"
    "7, movetoworkspace, 7"
  ];

  superCtrlBinds = builtins.map (x: "SUPER CTRL, " + x) [
    # Super+ctrl binds
  ];

  altBinds = builtins.map (x: "ALT, " + x) [
    # Alt binds
    "G, exec, grimblast --notify --cursor copysave screen"
  ];

  shiftBinds = builtins.map (x: "SHIFT, " + x) [
    # Shift binds
  ];

  ctrlBinds = builtins.map (x: "CTRL, " + x) [
    # Ctrl binds
  ];

  ctrlShiftBinds = builtins.map (x: "CTRL SHIFT, " + x) [
    # Ctrl+shift binds
  ];
in
  superBinds ++ superShiftBinds ++ superCtrlBinds ++ altBinds ++ ctrlBinds ++ ctrlShiftBinds ++ shiftBinds
# Docs
# https://wiki.hyprland.org/Getting-Started/Master-Tutorial/

