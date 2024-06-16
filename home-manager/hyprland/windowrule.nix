let
  centerWindows = [
    "center, ^(gnome-characters)$"
    "center, ^(mpv)$"
    "center, ^(nomacs)$"
    "center, ^(stremio)$"
  ];
  opaqueWindows = builtins.map (x: "opaque, " + x) [
    "^(firefox)$"
    "^(gimp)$"
    "^(kdenlive)$"
    "^(krita)$"
    "^(mpv)$"
    "^(stremio)$"
  ];
in
  centerWindows ++ opaqueWindows
