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
        key.width = 14;
      };
      modules = [
        {
          type = "os";
          key = " システム ";
          format = "{3}";
        }
        {
          type = "kernel";
          key = " カーネル  ";
          format = "{1} {2} ({4})";
        }
        {
          type = "uptime";
          key = " アップタイム  ";
        }
        {
          type = "wm";
          key = " wm      ";
        }
        {
          type = "terminal";
          key = "ターミナル  ";
        }
        {
          type = "terminalfont";
          key = "フォント      ";
        }
        {
          type = "shell";
          key = "シェル     ";
        }
        {
          type = "command";
          key = "󰆧 パッケージ";
          text = "(${lib.getExe' pkgs.nix "nix-store"} --query --requisites /run/current-system | wc -l | tr -d '\n') && echo ' (nix; /run/current-system)'";
        }
        {
          type = "memory";
          key = "󰍛 メモリー  ";
        }
        {
          type = "disk";
          key = "󱥎 貯蔵 ";
          format = "{1} / {2} ({3})";
          folders = "/";
        }
        {
          type = "battery";
          key = "電池   ";
        }
        {
          type = "cpu";
          key = "CPU       ";
        }
        {
          type = "gpu";
          key = "GPU       ";
        }
      ];
    };
  };
}
