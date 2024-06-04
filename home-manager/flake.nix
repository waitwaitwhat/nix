{
  description = "Home Manager configuration of w8";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    lexical = {
      type = "github";
      owner = "lexical-lsp";
      repo = "lexical";
    };
  };
  outputs = { nixpkgs, home-manager, hyprland, ... }@inputs:
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
          hyprland.homeManagerModules.default
          {wayland.windowManager.hyprland.enable = true;}
        ];
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      nest-nvim = pkgs.callPackage ./pkgs/nest-nvim.nix {};
      icon-picker-nvim = pkgs.callPackage ./pkgs/icon-picker.nix {};
      transparent-nvim = pkgs.callPackage ./pkgs/transparent-nvim.nix {};
    };
}
