
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

      programs.git = {
        enable = true;
        userName = "Divyanshu Sharma";
        userEmail = "twins-divyanshu-sharma@github.com";
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
                      ___
                _,-'""   """"`--.
             ,-'          __,,-- \
           ,'    __,--""""dF      )
          /   .-"Hb_,--""dF      /
        ,'       _Hb ___dF"-._,-'
      ,'      _,-""""   ""--..__
     (     ,-'                  `.
      `._,'     _   _             ;
       ,'     ,' `-'Hb-.___..._,-'
       \    ,'"Hb.-'HH`-.dHF"
        `--'   "Hb  HH  dF"
                "Hb HH dF
                 "HbHHdF
                  |HHHF
                  |HHH|
                  |HHH|
                  |HHH|
                  |HHH|
                  dHHHb
                .dFd|bHb.               o
      o       .dHFdH|HbTHb.          o /
\  Y  |  \__,dHHFdHH|HHhoHHb.______  Y
########################################## '';

      programs.bash = {
        enable = true;
        bashrcExtra= ''
          export PS1="\n\[\033[1;33m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]₹\[\033[0m\] "
          fastfetch --logo .config/fastfetch/logo
        '';
      };
      
      
      programs.waybar = rec {
        style =  ''
         #workspaces button.active {
          color: #262626;
          background: #9cfa05;
        }
        '';

      };

  }; #end user


}; # end home manager

}
