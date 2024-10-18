{ pkgs, ... }: 
{
  environment.sessionVariables.FLAKE = "/home/w8/nix";
  programs = {
    dconf.enable = true;
    zsh.enable = true;
    # eza.enable = true;
    git.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    # ladybird.enable = true;
    mtr.enable = true;
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 1d --keep 3 --ask";
    };
    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [

    ];
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    wireshark = {
      enable = true;
      };
  };
}
