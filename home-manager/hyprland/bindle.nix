let
  superBinds = builtins.map (x: "SUPER, " + x) [
    ", XF86MonBrightnessUp, exec, brillo -r 19200 -A 480"
    ", XF86MonBrightnessDown, exec, brillo -r 19200 -U 480"
  ];
in
  superBinds ++ altBinds
