
{ args, config, lib, pkgs, ... }:

{
  
  imports = [
  ];

  home.packages = [
    pkgs.fastfetch
    pkgs.lf
  ];


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
    shellAliases = {
      vim = "nvim";
    };

    bashrcExtra= ''
      export PS1='\[\e[37m\]✦━┫▬▬\[\e[94m\]\u\[\e[37m\]▬▬\[\e[32m\]\h\[\e[37m\]▬▬▬▬\[\e[36m\]\w\[\e[37m\]▬▬▬▸\n\[\e[0m\]'

      export LS_COLORS="''${LS_COLORS}:di=93"
      fastfetch --logo .config/fastfetch/logo
      lfcd () {
        cd "$(command lf -print-last-dir "$@")"
      }
    '';

  };

}
