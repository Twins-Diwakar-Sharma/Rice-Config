{ pkgs, ... }:
{

  users.users.thanatos = {
    isNormalUser = true;
    initialPassword = "password@123";
    description = "thanatos";
    extraGroups = [ "networkManager" "wheel" "audio" "jackaudio" "kvm" "libvirtd" "adbusers" ];
  };


  home-manager = {
    users.thanatos = {
			imports = [ ./home.nix ../customPackages/hexeon/hexeon.nix ];

			home.homeDirectory = "/home/thanatos";

      programs.git = {
        enable = true;
        userName = "Diwakar Sharma";
        userEmail = "twins-diwakar-sharma@github.com";
      };


      programs.hexeon = {
        enable = true;
        insertColor = {
          r = 250; g = 25; b = 25;  
        };
        textColor = {
          r = 250; g = 70; b = 70;
        };
      };

      home.file.".config/fastfetch/logo".text = 
''
         ___---___                    
      .--         --.      
    ./   ()      .-. \.
   /   o    .   (   )  \
  / .            '-'    \         
 | ()    .  O         .  |      
|                         |      
|    o           ()       |
|       .--.          O   |            
 | .   |    |            |
  \    `.__.'    o   .  /    
   \                   /                   
    `\  o    ()      /' 
      `--___   ___--'
            ---     
'';

      programs.bash = {
        enable = true;
        # old shit, use promptInit
        bashrcExtra = ''
          export PS1="\n\[\033[1;36m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]₹\[\033[0m\] "
          fastfetch --logo .config/fastfetch/logo
        '';
      };
      
      
      programs.waybar = rec {
        style =  ''
          #workspaces button {
            padding: 0 2px;
            color: #fdf6e3;
          }
          #workspaces button.active {
            color: #262626;
            background: #fe4545;
          }
        '';
      };


  }; #end user


}; # end home manager

}
