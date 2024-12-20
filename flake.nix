{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";


    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # eza = {
      # url = "github:eza-community/eza";
      # inputs = {
        # nixpkgs.follows = "nixpkgs";
        # rust-overlay.follows = "rust-overlay";
      # };
    # };
    
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
  
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, nixos-cosmic, disko, rust-overlay, sops-nix, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
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
            nixos-cosmic.nixosModules.default
	          ({ pkgs, lib, ... }: {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];

              environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
                pkgs.sbctl
                pkgs.rust-bin.stable.latest.default
              ];
              
              nix.settings = {
                substituters = [ "https://cosmic.cachix.org/" ];
                trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
              };

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
          specialArgs = {
            inherit inputs;
          };
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
              ];
              
              nix.settings = {
                substituters = [ 
                  "https://cosmic.cachix.org"
                  "https://ezkea.cachix.org"
                ];
                trusted-public-keys = [ 
                  "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" 
                  "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
                ];
              };

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
            nixos-cosmic.nixosModules.default
          ];
        };

        macbook = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/macbook/configuration.nix
            disko.nixosModules.disko
            inputs.home-manager.nixosModules.default
	          sops-nix.nixosModules.sops
	          ({ pkgs, lib, ... }: {
              nixpkgs.overlays = [ rust-overlay.overlays.default ];

              environment.systemPackages = [
                pkgs.rust-bin.stable.latest.default
              ];
              
              nix.settings = {
                substituters = [ 
                  "https://cosmic.cachix.org"
                  "https://ezkea.cachix.org"
                ];
                trusted-public-keys = [ 
                  "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" 
                  "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
                ];
	      };
            })
            nixos-cosmic.nixosModules.default
          ];
        };
    };
  };
}
