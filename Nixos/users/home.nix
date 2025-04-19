{config, lib, pkgs, ... }:

{
  home.packages = [
   # pkgs.ccls
  ];

	programs.home-manager.enable = true;

	programs.bash = {
		enable = true;
		shellAliases = {
      vim = "nvim";
		};
	};

  programs.lf = {
    enable = true;
    
    settings = {
      preview = true;
      drawbox = true;
      icons = true;
    };

  };
  
}
