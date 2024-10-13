{ args, config, lib, pkgs,  home-manager, ... }:

{

  imports = [
    args.home-manager.nixosModules.home-manager
  ];




  services.xserver = {
    enable = true; 

    xkb = {
      layout = "us";
      variant = "";
    };

    desktopManager = {
      xterm.enable = false;  
    };

    displayManager = {
      defaultSession = "none+i3";
    };
    
   windowManager.i3 = {
        package = pkgs.i3-gaps;
        #enable = true;
        extraPackages = with pkgs; [
          dmenu 
          i3status 
          i3lock 
          rxvt-unicode-unwrapped-emoji
          feh
          xclip
       ];
       configFile = "/etc/i3.conf";
    };

  };

  
  # shifted this setttings to respected users
  environment.etc."i3.conf".text = (pkgs.callPackage ./i3-config.nix {} ) + 
''
bar{
        status_command i3status
	font pango:Adobe Courier:style=Regular 8
	colors{
        		                # border bg text 
            focused_workspace #55f880 #55f880 #000000
		        inactive_workspace #000000 #000000 #00ddff
        }
}
'';

  home-manager.sharedModules = [{


    programs.urxvt.scroll.bar.enable = false;

    xsession.windowManager.i3 = {
      
    }; # end xsession


    
    xresources.properties = {
      "URxvt*background" = "black";
      "URxvt*foreground" = "white";
      "URxvt*scrollBar" = "false";
      "URxvt.font" = "xft:ComicShannsMono\ Nerd\ Font:size=10";
    };



  } # end home-manager

  ];
}
