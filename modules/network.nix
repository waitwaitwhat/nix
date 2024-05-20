{ pkgs, ... }: 
{
  networking = {
    hostName = "nix-laptop";
    networkmanager.enable = true;
    # wireless.enable = true;
    nameservers = [ "1.1.1.1" ];
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 ];
      # allowedUDPPorts = [ ];
      # allowedUDPPortRanges = [
        # { from = 4000; to = 4007; }
        # { from = 8000; to = 8010; }
      # ];
    };
    # proxy = {
      # default = "http://user:password@proxy:port/";
      # noProxy = "127.0.0.1,localhost,internal.domain";
    # }
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}