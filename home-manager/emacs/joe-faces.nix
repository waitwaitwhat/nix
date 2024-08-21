# Joe's dotfiles
# Copyright (C) 2023  Josep Jesus Bigorra Algaba (jjbigorra@gmail.com)

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

{ osConfig, lib, ... }:
let
  serif = osConfig.masterOptions.joe.serifFontFamily;
  sans = osConfig.masterOptions.joe.sansFontFamily;
  mono = osConfig.masterOptions.joe.monospacedFontFamily;
  mkSetFaceAttribute = import ./mk-set-face-attribute.nix { inherit osConfig; };
  generalFaces = [
    {
      face = "line-number";
      height = "0.6";
      font = mono;
      backgroundSexp = "'unspecified";
    }
    {
      face = "line-number-current-line";
      height = "0.6";
      font = mono;
    }
    {
      face = "default";
      heightSexp = "(round (mk-font-size 114))";
      font = mono;
    }
    {
      face = "fixed-pitch";
      height = "1.0";
      font = mono;
    }
    # {
    #   face = "markdown-pre-face";
    #   height = "1.0";
    #   font = mono;
    # }
    {
      face = "variable-pitch";
      height = "1.22";
    }
    {
      face = "variable-pitch-text";
      height = "1.22";
    }
    {
      face = "font-lock-comment-face";
      font = mono;
      italic = true;
      height = "1.0";
    }
    {
      face = "header-line";
      font = sans;
      height = "0.5";
      box = ''
        '(:line-width 4 :color "${osConfig.masterOptions.joe.backgroundHexColor}")'';
    }
    {
      face = "flymake-errline";
      underline = "#f38ba8";
      font = mono;
    }
    {
      face = "flymake-warnline";
      underline = "#f9e2af";
      font = mono;
    }
    {
      face = "flymake-error";
      underline = "#f38ba8";
      font = mono;
    }
    {
      face = "flymake-warning";
      underline = "#f9e2af";
      font = mono;
    }
    # {
    #   face = "vertical-border";
    #   font = null;
    #   height = null;
    #   background = osConfig.masterOptions.joe.highlightHexColor;
    #   foreground = osConfig.masterOptions.joe.highlightHexColor;
    # }
    {
      face = "window-divider";
      font = null;
      height = null;
      background = osConfig.masterOptions.joe.highlightHexColor;
      foreground = osConfig.masterOptions.joe.highlightHexColor;
    }
  ];
  markdownFaces = [
    {
      face = "markdown-header-face-1";
      height = "1.44";
      font = serif;
      weight = "bold";
    }
    {
      face = "markdown-header-face-2";
      height = "1.38";
      font = serif;
      weight = "bold";
    }
    {
      face = "markdown-header-face-3";
      height = "1.34";
      font = serif;
      weight = "bold";
    }
    {
      face = "markdown-header-face-4";
      height = "1.32";
      font = serif;
      weight = "bold";
    }
    {
      face = "markdown-header-face-5";
      height = "1.28";
      font = serif;
      weight = "bold";
    }
  ];
  orgFaces = [
    {
      face = "org-code";
      font = mono;
      inherits = [ "shadow" "fixed-pitch" ];
      height = "1.0";
    }
    {
      face = "org-verbatim";
      inherits = [ "shadow" "fixed-pitch" ];
      height = "1.0";
    }
    {
      face = "org-special-keyword";
      inherits = [ "font-lock-comment-face" "fixed-pitch" ];
      height = "1.0";
    }
    {
      face = "org-special-keyword";
      inherits = [ "font-lock-comment-face" "fixed-pitch" ];
      height = "1.0";
    }
    {
      face = "org-meta-line";
      font = sans;
      inherits = [ "font-lock-comment-face" ];
    }
    {
      face = "org-document-info-keyword";
      font = sans;
      inherits = [ "font-lock-comment-face" ];
    }
    {
      face = "org-checkbox";
      inherits = [ "fixed-pitch" ];
      height = "1.0";
    }
    {
      face = "org-table";
      inherits = [ "fixed-pitch" ];
      height = "1.0";
    }
    {
      face = "org-block";
      font = mono;
      height = "1.0";
      inherits = [ "fixed-pitch" ];
      #foreground = "unspecified";
      #backgroundSexp = "(ef-themes-get-color-value 'bg-alt :overrides)";
    }
    {
      face = "org-level-1";
      height = "1.5";
      font = serif;
      weight = "bold";
    }
    {
      face = "org-level-2";
      height = "1.44";
      font = serif;
      weight = "bold";
    }
    {
      face = "org-level-3";
      height = "1.44";
      font = serif;
      weight = "bold";
    }
    {
      face = "org-level-4";
      height = "1.34";
      font = serif;
      weight = "bold";
    }
    {
      face = "org-level-5";
      height = "1.34";
      font = serif;
      weight = "bold";
    }
    {
      face = "org-level-6";
      height = "1.28";
      font = serif;
      weight = "bold";
    }
    {
      face = "org-level-7";
      height = "1.2";
      font = serif;
      weight = "bold";
    }
    {
      face = "org-level-8";
      height = "1.2";
      font = serif;
      weight = "bold";
    }
  ];
  dashboardFaces = [
    {
      face = "dashboard-banner-logo-title";
      font = serif;
      height = "1.3";
      weight = "bold";
    }
    {
      face = "dashboard-footer-face";
      font = serif;
      height = "1.2";
      weight = "bold";
    }
  ];
  modelineFaces = [
    {
      face = "mode-line";
      font = sans;
      height = "0.5";
      box = ''
        '(:line-width 4 :color "${osConfig.masterOptions.joe.background2HexColor}")'';
      background = osConfig.masterOptions.joe.background2HexColor;
      foreground = osConfig.masterOptions.joe.foregroundHexColor;
    }
    {
      face = "mode-line-active";
      font = sans;
      height = "0.5";
      box = ''
        '(:line-width 4 :color "${osConfig.masterOptions.joe.background2HexColor}")'';
      background = osConfig.masterOptions.joe.background2HexColor;
      foreground = osConfig.masterOptions.joe.foregroundHexColor;
    }
    {
      face = "mode-line-inactive";
      font = sans;
      height = "0.5";
      box = ''
        '(:line-width 4 :color "${osConfig.masterOptions.joe.backgroundHexColor}")'';
      background = osConfig.masterOptions.joe.backgroundHexColor;
      foreground = "gray";
    }
    {
      face = "fringe";
      backgroundSexp = "'unspecified";
    }
  ];
  joeFaces = lib.lists.flatten [
    generalFaces
    markdownFaces
    orgFaces
    dashboardFaces
    modelineFaces
  ];

  myFaces = builtins.concatStringsSep " " (map mkSetFaceAttribute joeFaces);
in ''
  (defun joe/set-faces ()
    (interactive)
    ${myFaces}
  )
''
