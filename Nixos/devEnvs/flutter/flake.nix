# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      fhs = pkgs.buildFHSEnv {
        name = "fhs-shell";
        targetPkgs = pkgs: [
          pkgs.flutter 
          pkgs.tmux 
          pkgs.jdk17
          pkgs.postgresql
          pkgs.pkg-config
          pkgs.sdkmanager
          pkgs.zlib
        ] ;


      };
    in
      {
        devShells.${system}.default = fhs.env;
      };
}
