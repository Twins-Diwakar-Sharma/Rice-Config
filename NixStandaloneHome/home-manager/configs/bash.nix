
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
      export PS1="\n\[\033[1;33m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]₹\[\033[0m\] "
      fastfetch --logo .config/fastfetch/logo
      lfcd () {
        cd "$(command lf -print-last-dir "$@")"
      }
    '';

  };

}
