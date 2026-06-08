
{ pkgs, ... }:
{

  users.users.hypnos = {
    isNormalUser = true;
    initialPassword = "password@123";
    description = "hypnos";
    extraGroups = [ "networkManager" "wheel" "audio" "jackaudio" "kvm" "libvirtd" "adbusers" ];
  };


  home-manager = {



    users.hypnos = {
			imports = [ ./home.nix ../customPackages/hexeon/hexeon.nix ];

			home.homeDirectory = "/home/hypnos";
      
      services.wpaperd = {
        enable = true;
        settings = {
          eDP-1 = {
            path = "/home/hypnos/Pictures/wallpapers/";
            duration = "30m";
            sorting = "ascending";
          };
        };
      };

      programs.git = {
        enable = true;
        settings = {
          core.editor = "nvim"; # Or "vim", "nano", "code --wait", etc.
          user = {
            name = "Divyanshu Sharma";
            email = "twins-divyanshu-sharma@github.com";
          };
        };
      };


      programs.hexeon = {
        enable = true;
        visualColor = {
          r = 20; g = 250;  b = 20;
        };
        textColor = {
          r = 50; g = 220; b = 100;
        };

      };

      home.file.".config/fastfetch/logo".text = 
      ''
                                         _.oo.
                 _.u[[/;:,.         .odMMMMMM'
              .o888UU[[[/;:-.  .o@P^    MMM^
             oN88888UU[[[/;::-.        dP^
            dNMMNN888UU[[[/;:--.   .o@P^
           ,MMMMMMN888UU[[/;::-. o@^
           NNMMMNN888UU[[[/~.o@P^
           888888888UU[[[/o@^-..
          oI8888UU[[[/o@P^:--..
       .@^  YUU[[[/o@^;::---..
     oMP     ^/o@P^;:::---..
  .dMMM    .o@^ ^;::---...
 dMMMMMMM@^`       `^^^^
YMMMUP^
 ^^
'';

      programs.bash = {
        enable = true;
        bashrcExtra= ''
          export PS1="\n\[\033[1;33m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]₹\[\033[0m\] "
          fastfetch --logo .config/fastfetch/logo
        '';
      };
      
      
      programs.waybar = rec {
        style =  ''
         #workspaces button{
          color: #9cfa05;
          background: #262626;
        }

         #workspaces button.active {
          color: #262626;
          background: #9cfa05;
        }

        #workspaces button.hover{
          color: #262626;
          background: #6acc02;
        }
        '';

      };

  }; #end user


}; # end home manager

}
