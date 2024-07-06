{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "nixpkgs/nixos-24.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    eza = {
      url = "github:eza-community/eza";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };
    
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
    
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, stable, lanzaboote, disko, eza, rust-overlay, sops-nix, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      stable = stable.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
      	nix-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/nix-laptop/configuration.nix
            disko.nixosModules.disko
            inputs.home-manager.nixosModules.default
	          lanzaboote.nixosModules.lanzaboote
	          sops-nix.nixosModules.sops
	          ({ pkgs, lib, ... }: {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];
              environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
                pkgs.sbctl
                pkgs.rust-bin.stable.latest.default
              ];

              # Lanzaboote currently replaces the systemd-boot module.
              # This setting is usually set to true in configuration.nix
              # generated at installation time. So we force it to false
              # for now.
              boot.loader = { 
	              systemd-boot.enable = lib.mkForce false;
	              grub.enable = lib.mkForce false;
	            };

              boot.lanzaboote = {
                enable = true;
                pkiBundle = "/etc/secureboot";
              };
            })
          ];
       };

       nix-workstation = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/nix-workstation/configuration.nix
            disko.nixosModules.disko
            inputs.home-manager.nixosModules.default
	          lanzaboote.nixosModules.lanzaboote
	          sops-nix.nixosModules.sops
	          ({ pkgs, lib, ... }: {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];
              environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
                pkgs.sbctl
                pkgs.rust-bin.stable.latest.default
              ];

              # Lanzaboote currently replaces the systemd-boot module.
              # This setting is usually set to true in configuration.nix
              # generated at installation time. So we force it to false
              # for now.
              boot.loader = { 
	              systemd-boot.enable = lib.mkForce false;
	              grub.enable = lib.mkForce false;
	            };

              boot.lanzaboote = {
                enable = true;
                pkiBundle = "/etc/secureboot";
              };
            })
          ];
        };
    };
  };
}
