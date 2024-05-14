{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    cosmic-edit
    cosmic-comp
    cosmic-comp
    cosmic-icons
    cosmic-greeter
    cosmic-applets
    cosmic-settings
    cosmic-bg
    cosmic-osd
    cosmic-store
    cosmic-term
    cosmic-randr
    cosmic-panel
    cosmic-files
    cosmic-session
    cosmic-protocols
    cosmic-screenshot
    cosmic-applibrary
    cosmic-notifications
    cosmic-settings-daemon
    cosmic-workspaces-epoch
    xdg-desktop-portal-cosmic
  ];
  
}
