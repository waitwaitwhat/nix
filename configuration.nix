{ config, pkgs, inputs, outputs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./w8.nix 
      ./wait.nix
      inputs.home-manager.nixosModules.home-manager
    ];
  
  # Enable Backups (VERY IMPORTANT/USEFUL)
  # Disable if using flakes, since you likely have a repo and flake.lock"s"
  # system.copySystemConfiguration = true;
  
  nixpkgs = {
    config = {
      # Allow Unfree
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
      # Enable NUR
      packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { inherit pkgs;
        };
      };
    };
  };

  # Nix Flakes * commands
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      options = " --delete-older-than 14d";
    };
    optimise = {
      automatic = false;
      dates = [ "Weekly" ];
    };
    package = pkgs.nixFlakes;
    # extraOptions = "lib.optionalString (config.nix.package == pkgs.nixFlakes)";
  };

  # Boot Accessories
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "acpi_osi=" ];
    blacklistedKernelModules = [ "b43" "bcma" ];
    # Bootloader
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot"; # ← use the same mount point here.
      };
      grub = {
         enable = true;
         efiSupport = true;
         # efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
         device = "nodev";
         # useOSProber = true;
      };
    };
  };

  users.users.w8 = {
    isNormalUser = true;
    home = "/home/w8";
    extraGroups = [ "wheel" "networkmanager" "homemanager" "nixbld" "video" "audio" "libvirtd" ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      w8 = ./home/home.nix
    };
  };

  networking.hostName = "tux"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };
  
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
  };

  # Hint electron apps to use wayland:
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    ELECTRON_ENABLE_LOGGING = "1";
    WAYLAND_DEBUG = "1";
  };

  hardware = {
    pulseaudio.enable = false;
    opengl.enable = true;
    # nvidia.modesetting.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.bash.enableCompletion = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
    # allowedUDPPorts = [ ... ];
  };

  # Enable sound with pipewire.
  sound.enable = true;
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
  services = {
    dbus.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOs release notes say you
  # should.
  system.stateVersion = "23.11"; # Did you read the comment?
}

