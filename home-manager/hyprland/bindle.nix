let
  superBinds = builtins.map (x: "SUPER, " + x) [
    "F3, exec, brillo -r 19200 -A 480"
    "F2, exec, brillo -r 19200 -U 480"
  ];
in
  superBinds
