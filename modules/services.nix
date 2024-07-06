{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      #libinput.enable = true;
      desktopManager.plasma6.enable = true;
      displayManager = {
	      lightdm.enable = false;
	      gdm.enable = false;
        sddm.enable = true;
      };
    };
    blueman.enable = true;
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;
    joycond.enable = true;
    logind = {
      extraConfig = ''
        # don’t shutdown when power button is short-pressed
        HandlePowerKey=ignore
      	HandlePowerKeyLongPress=reboot
	      HandleLidSwitch=hibernate
      '';
    };
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
      	PasswordAuthentication = true;
      };
    };
    power-profiles-daemon.enable = false;
    printing.enable = true;
    tlp ={
      enable = true;
      # settings = { 
      # };
    };
    thermald.enable = true;
    ratbagd.enable = true;
    syncthing.enable = true;
    hydra = {
      enable = false;
    };
    transmission = { 
      enable = true; #Enable transmission daemon
      settings = {
        download-dir = "${config.services.transmission.home}/Downloads";
      };
      openRPCPort = true; #Open firewall for RPC
      settings = { #Override default settings
        rpc-bind-address = "0.0.0.0"; #Bind to own IP
        rpc-whitelist = "127.0.0.1,10.0.0.1"; #Whitelist your remote machine (10.0.0.1 in this example)
      };
    };
    resolved = {
      enable = true;
      dnssec = "true";
      llmnr = "false";
      extraConfig = ''
        DNSOverTLS=yes
	      DNS=1.1.1.1#cloudflare-dns.com
	      DNS=8.8.8.8#dns.google
      	DNS=1.0.0.1#cloudflare-dns.com
      	DNS=8.8.4.4#dns.google
      	FallbackDNS=
      	MulticastDNS=true
      '';
    };
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
