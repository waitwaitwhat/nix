{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lanzaboote, disko, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
      	nix-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/nix-laptop/configuration.nix
            inputs.home-manager.nixosModules.default
	    lanzaboote.nixosModules.lanzaboote
	    ({ pkgs, lib, ... }: {

              environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
                pkgs.sbctl
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
	w8-hp = nixpkgs.lib.nixosSystem {
	  specialArgs = {inherit inputs;};
          modules = [
            ./hosts/w8-hp/configuration.nix
            inputs.home-manager.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
	    ({ pkgs, lib, ... }: {

              environment.systemPackages = [
              # For debugging and troubleshooting Secure Boot.
                pkgs.sbctl
              ];

              # Lanzaboote currently replaces the systemd-boot module.
              # This setting is usually set to true in configuration.nix
              # generated at installation time. So we force it to false
              # for now.
              boot.loader.systemd-boot.enable = lib.mkForce false;

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
