{
    description = "Configuration Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        nixvim.url = "github:nix-community/nixvim/nixos-24.05";
        nixvim.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, ... }@args: 
    let 
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        specialArgs = { inherit args system; };
        otherModules = [
          home-manager.nixosModules.home-manager {
            home-manager = {
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
              backupFileExtension = "hm-backup";
            };
          }
        ];
    in {
        nixosConfigurations = {
           nyx = nixpkgs.lib.nixosSystem {
                inherit system;
                inherit specialArgs;
                modules = otherModules ++ [ 
                  ./configuration.nix 
                  ./packages/nixvim.nix
                  #./i3.nix
                  ./hyprland/hyprland.nix
                  ./users/thanatos.nix
                  ./users/hypnos.nix
                ];
           };
        };
    };
}
