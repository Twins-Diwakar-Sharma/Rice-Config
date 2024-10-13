{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "hexeon";
  version = "0.0.0";

  src = ./.;

  buildInputs = [
    pkgs.glfw
    pkgs.wayland
  ];

  nativeBuildInputs = with pkgs; [
    makeWrapper
  ];

  # buildPhase = uses makefile if present automatically
  
  # NOTICE: the bin folder, you must keep in $out/bin to enable it in path
  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/bin/res
    cp $src/binary/hexeon $out/bin/hexeon
    cp -r $src/res/* $out/bin/res/
  '';
  
  postFixup = ''
    wrapProgram $out/bin/hexeon \
    --set LD_LIBRARY_PATH ${pkgs.lib.makeLibraryPath [pkgs.glfw pkgs.wayland]}
  '';
}
