{ args, config, lib, pkgs, ... }:


let
  cyberpunk-neon = pkgs.stdenvNoCC.mkDerivation {
    pname = "cyberpunk-neon-cursors";
    version = "1.0.0";

    src = pkgs.fetchurl {
      url = "https://github.com/ayushkrsingh/cyberpunk-neon-cursors/raw/main/dist/Cyberpunk-Neon-1.0.0.zip";
      #hash = "sha256-jLlI8NzlcGvSkghqulIlyTfuUMjbTqelUZ6NHzDvpD4=";
      hash = "sha256-a8DJ5npKBZ6VhIP83JbyJCYWJl98sx3RBMr7iKSMmxk=";
      # how to get hash?
      # put fake hash
      # error message will give correct hash
    };

    nativeBuildInputs = [
      pkgs.unzip
    ];

    sourceRoot = ".";

    unpackPhase = ''
      unzip $src
    '';

    installPhase = ''
      mkdir -p $out/share/icons
      cp -r Cyberpunk-Neon* $out/share/icons/
    '';
  };
in
{
  
  imports = [
  ];

  home.packages = [
    pkgs.nightdiamond-cursors
    cyberpunk-neon
  ];

  home.pointerCursor = {
    enable = true;
    dotIcons.enable = true;
    gtk.enable = true;
    #package = pkgs.nightdiamond-cursors;
    #name = "Night Diamond Red";
    size = 32;
    gtk.size = 32;

    package = cyberpunk-neon;
    name = "Cyberpunk-Neon";

  };

  home.sessionVariables = {
    #XCURSOR_THEME = "Night Diamond Red";
    XCURSOR_THEME = "Cyberpunk-Neon";
    XCURSOR_SIZE = "32";
  };

}

