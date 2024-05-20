{
  pkgs,
  lib,
  ...
}: let
  inherit (import ./options.nix) dotfilesDir userName;
in {
  programs = {
    direnv = {
      enable = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };

    nushell = {
      enable = true;
      shellAliases = let
        g = lib.getExe pkgs.git;
        c = "cargo";
      in {
        # Cargo
        cb = "${c} build";
        cc = "${c} check";
        cn = "${c} new";
        cr = "${c} run";
        cs = "${c} search";
        ct = "${c} test";

        # Git
        ga = "${g} add";
        gc = "${g} commit";
        gd = "${g} diff";
        gl = "${g} log";
        gs = "${g} status";
        gp = "${g} push origin main";

        # ETC.
        c = "clear";
        la = "ls -la";
        ll = "ls -l";
        nv = "nvim";

        # cat = "${pkgs.bat}/bin/bat";
        # df = "${pkgs.duf}/bin/duf";
        # find = "${pkgs.fd}/bin/fd";
        grep = "${pkgs.ripgrep}/bin/rg";
        tree = "${pkgs.eza}/bin/eza --git --icons --tree";
      };

      environmentVariables = {
        PROMPT_INDICATOR_VI_INSERT = ''"  "'';
        PROMPT_INDICATOR_VI_NORMAL = ''"∙ "'';
        PROMPT_COMMAND = ''""'';
        PROMPT_COMMAND_RIGHT = ''""'';
        DIRENV_LOG_FORMAT = ''""''; # make direnv quiet
        SHELL = ''"${pkgs.nushell}/bin/nu"'';
        EDITOR = ''"nvim"'';
      };
    };
  };
}
