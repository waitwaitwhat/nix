{
  description = "Home Manager configuration of w8";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprcursor-phinger.url = "github:jappie3/hyprcursor-phinger";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    lexical.url = "github:lexical-lsp/lexical?ref=v0.6.1";
  };
  outputs = { nixpkgs, home-manager, hyprland, hyprcursor-phinger, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      allowUnfree = { nixpkgs.config.allowUnfree = true; };
    in {
      homeConfigurations."w8" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	      extraSpecialArgs = {inherit inputs;};
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ./home.nix
          hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
          hyprland.homeManagerModules.default
          {wayland.windowManager.hyprland.enable = true;}
        ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      # nest-nvim = pkgs.callPackage ./pkgs/nest-nvim.nix {};
      # icon-picker-nvim = pkgs.callPackage ./pkgs/icon-picker.nix {};
      # transparent-nvim = pkgs.callPackage ./pkgs/transparent-nvim.nix {};
    };
}
