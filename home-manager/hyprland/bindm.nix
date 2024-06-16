let
  superBinds = builtins.map (x: "SUPER, " + x) [
    "mouse:272, resizewindow"
    "mouse:273, movewindow"
  ];

  altBinds = builtins.map (x: "ALT, " + x) [
    # alt binds
  ];
in
  superBinds ++ altBinds
