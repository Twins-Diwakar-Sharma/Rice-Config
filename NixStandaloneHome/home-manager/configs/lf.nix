
{ args, config, lib, pkgs, ... }:

{
  
  imports = [
  ];
  
  home.packages = [
    pkgs.chafa
    pkgs.lf
    pkgs.foot
  ];

    home.file.".config/lf/preview.sh" = { 
      text = ''
      #!/bin/sh
      case "$1" in
        *.tar*) tar tf "$1";;
        *.zip) unzip -l "$1";;
        *.jpg) chafa "$1" --size="$2"x"$3";;
        *.jpeg) chafa "$1" --size="$2"x"$3";;
        *.png) chafa "$1" --size="$2"x"$3";;
        *) cat "$1";;
      esac
          '';
      executable = true;
      enable = true;
    };

    programs.lf = {
      enable = true;

      settings = {
        drawbox = true;
        icons = true;
        preview = true;
      };
      
      extraConfig = ''
        # Basic Settings
        set ignorecase true
        set icons true
        set sixel true

        set previewer ~/.config/lf/preview.sh
      '';
     
    };

}
