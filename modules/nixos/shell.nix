let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  nativeBuildInputs = [
  ];
  packages = [
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.requests
    ]))
  ];
  shellHook = ''
  '';
}

