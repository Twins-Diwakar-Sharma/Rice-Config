{ args, config, lib, pkgs, ... }:

{

  imports = [
    ../customPackages/hexeon/hexeon.nix
  ];

  programs.hexeon = {
    enable = true;
    insertColor = {
      r = 250; g = 25; b = 25;  
    };
    textColor = {
      r = 250; g = 70; b = 70;
    };
  };

}
