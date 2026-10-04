{
  description = "A very basic flake";

  inputs = {
    #nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  };

	outputs = { self, nixpkgs, ... }@args: 
		let 
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
			specialArgs = { inherit args system; };
			otherModules = [
			];

			in {
				nixosConfigurations = {
					scourge = nixpkgs.lib.nixosSystem {
						inherit system;
						inherit specialArgs;
						modules = otherModules ++ [ 
							./configuration.nix 
						];
					};
				};
			};
}

## Location: /etc/nixos

## commands:
#### 1. rebuild
#### nixos-rebuild boot --flake /etc/nixos#scourge


