{ args, config, lib, pkgs, ... }:
{
  
  imports = [
  ];

  home.packages = [
  ];

  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github-diwakar" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github_diwakar";
        identitiesOnly = true;
      };

      "github-divyanshu" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github_divyanshu";
        identitiesOnly = true;
      };
    };
  };


  programs.git = {
    enable = true;

    # Default configuration
    #userName = "Lich";
    #userEmail = "lich@example.com";

    extraConfig = {
      includeIf."gitdir:~/Programs/diwakar/" = {
        path = "~/.gitconfig-diwakar";
      };

      includeIf."gitdir:~/Programs/divyanshu/" = {
        path = "~/.gitconfig-divyanshu";
      };
    };
  };

  # -------------------------
  # Lich Git configuration
  # -------------------------
  home.file.".gitconfig-diwakar".text = ''
    [user]
        name = Diwakar 
        email = diwakar@example.com

    [url "git@github-diwakar:"]
        insteadOf = git@github.com:
  '';

  # -------------------------
  # Sylvanas Git configuration
  # -------------------------
  home.file.".gitconfig-divyanshu".text = ''
    [user]
        name = Divyanshu 
        email = divyanshu@example.com

    [url "git@github-divyanshu:"]
        insteadOf = git@github.com:
  '';

}
