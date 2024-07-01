{ pkgs, lib, ... }: 
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "~/Downloads/fastfetch.jpg";
        padding = {
          left = 1;
          right = 3;
        };
      };
      display = {
        separator = " ";
        keyWidth = 14;
      };
      modules = [
        {
          type = "os";
          key = " system  ";
          format = "{3}";
        }
        {
          type = "kernel";
          key = " kernel  ";
          format = "{1} {2} ({4})";
        }
        {
          type = "uptime";
          key = " uptime  ";
        }
        {
          type = "wm";
          key = " wm      ";
        }
        {
          type = "terminal";
          key = "terminal  ";
        }
        {
          type = "terminalfont";
          key = "font      ";
        }
        {
          type = "shell";
          key = "shell     ";
        }
        {
          type = "command";
          key = "󰆧 packages";
          text = "(${lib.getExe' pkgs.nix "nix-store"} --query --requisites /run/current-system | wc -l | tr -d '\n') && echo ' (nix; /run/current-system)'";
        }
        {
          type = "memory";
          key = "󰍛 memory  ";
        }
        {
          type = "disk";
          key = "󱥎 storage ";
          format = "{1} / {2} ({3})";
          folders = "/";
        }
        {
          type = "battery";
          key = "battery   ";
        }
        {
          type = "cpu";
          key = "cpu       ";
        }
        {
          type = "gpu";
          key = "gpu       ";
        }
      ];
    };
  };
}
