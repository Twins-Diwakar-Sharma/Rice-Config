{ pkgs, ... }:
{
  users.users.hypnos = {
    isNormalUser = true;
    initialPassword = "password@123";
    description = "hypnos";
    extraGroups = [ "networkManager" "wheel" "audio" "jackaudio"];
  };

  home-manager = {
    users.hypnos = {
			imports = [ ./home.nix ../customPackages/hexeon/hexeon.nix ];

      home.stateVersion = "24.05";
			home.homeDirectory = "/home/hypnos";

      programs.git = {
        enable = true;
        userName = "Divyanshu Sharma";
        userEmail = "twins-divyanshu-sharma@github.com";
      };
      
      home.file.".config/fastfetch/logo".text = 
      ''
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣴⣶⣶⣶⣶⣦⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⠏⠁⠀⢶⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀
⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⡿⠿⣿⠀⠀⠀⠀⣿⠿⢿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀
⠀⢠⣾⣿⣿⣿⣿⣿⡿⠋⣠⣴⣿⣷⣤⣤⣾⣿⣦⣄⠙⢿⣿⣿⣿⣿⣿⣷⡄⠀
⠀⣼⣿⣿⣿⣿⣿⡏⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⢹⣿⣿⣿⣿⣿⣧⠀
⢰⣿⣿⣿⣿⣿⡿⠀⣾⣿⣿⣿⣿⠟⠉⠉⠻⣿⣿⣿⣿⣷⠀⢿⣿⣿⣿⣿⣿⡆
⢸⣿⣿⣿⣿⣿⣇⣰⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣿⣆⣸⣿⣿⣿⣿⣿⡇
⠸⣿⣿⣿⡿⣿⠟⠋⠙⠻⣿⣿⣿⣦⣀⣀⣴⣿⣿⣿⣿⠛⠙⠻⣿⣿⣿⣿⣿⠇
⠀⢻⣿⣿⣧⠉⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠈⣿⣿⣿⡟⠀
⠀⠘⢿⣿⣿⣷⣦⣤⣴⣾⠛⠻⢿⣿⣿⣿⣿⡿⠟⠋⣿⣦⣤⠀⣰⣿⣿⡿⠃⠀
⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣄⣈⣁⣠⣤⣶⣾⣿⣿⣷⣾⣿⣿⡿⠁⠀⠀
⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠻⠿⠿⠿⠿⠟⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
      '';

      programs.bash = {
        enable = true;
        bashrcExtra = "fastfetch --logo .config/fastfetch/logo";
      };

      programs.fastfetch.settings.display.color = "red";

    }; # end of hypnos
  }; # end of home-manager


}
