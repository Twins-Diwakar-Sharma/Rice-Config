{
  description = "Home Manager configuration of frostmourne";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # Specify the source of Home Manager and Nixpkgs.
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
    };
  };

  outputs =
  { nixpkgs, home-manager, nixvim, ... }@inputs:
  let
    system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    homeConfigurations."frostmourne" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [ 
        ./home.nix 
        ./configs/niri.nix 
        ./configs/waybar.nix 
        ./configs/nixvim.nix 
        ./configs/bash.nix
        ./configs/foot.nix
        ./configs/hexeon.nix
        ./configs/lf.nix
        ./configs/wpaperd.nix
        ./configs/cursor.nix
        ./configs/github.nix
      ];


      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
      extraSpecialArgs = {
        inherit inputs;
      };

    };
  };
}

# location: .config/home-manager/

# commands
# 1. For building flake 
## cd .config/home-manager/
## home-manager switch --flake .#frostmourne

# 2. For garbade collection
## home-manager expire-generations "-0 days"
## sudo nix-collect-garbage -d
## nix-store --optimise
