{config, lib, pkgs, ... }:

{
  home.packages = [
   # pkgs.ccls
  ];

  home.stateVersion = "25.05";

	programs.home-manager.enable = true;

	programs.bash = {
		enable = true;
		shellAliases = {
      vim = "nvim";
		};
	};

  
}
