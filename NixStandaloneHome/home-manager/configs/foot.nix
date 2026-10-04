{ args, config, lib, pkgs, ... }:

{
  
  imports = [
  ];

  home.packages = [
    pkgs.foot
  ];

  programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "DaddyTimeMono Nerd Font Mono:size=12";
          #font = "3270 Nerd Font Mono:size=12";
        };
        colors-dark = {
          alpha = 0.8;
          background = "121212";
        };
      };
  };


}
