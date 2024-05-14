{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.w8.shell = pkgs.zsh;
}
