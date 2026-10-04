
{ args, config, lib, pkgs, ... }:

{

  imports = [
  ];

  home.packages = [
    pkgs.wpaperd
  ];

  services.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = "/home/frostmourne/Pictures/wallpapers/";
        duration = "15m";
        sorting = "random";
      };
    };
  };
}
