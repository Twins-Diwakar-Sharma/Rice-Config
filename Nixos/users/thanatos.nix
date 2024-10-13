{ pkgs, ... }:
{

  users.users.thanatos = {
    isNormalUser = true;
    initialPassword = "password@123";
    description = "thanatos";
    extraGroups = [ "networkManager" "wheel" "audio" "jackaudio"];
  };


  home-manager = {
    users.thanatos = {
			imports = [ ./home.nix ../customPackages/hexeon/hexeon.nix ];

      home.stateVersion = "24.05";
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

      programs.bash = {
        enable = true;
        bashrcExtra = ''
export PS1="\[$(tput setaf 214)\][\u@\h:\w]$\[$(tput sgr0)\] "
        '';
      };
      

  }; #end user


}; # end home manager

}
