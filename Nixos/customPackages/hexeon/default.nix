{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "hexeon";
  version = "0.0.0";
  
  src = ./.;

  buildInputs = with pkgs; [
    glfw
    wayland
    libGL
    mesa
    gcc
  ];

  nativeBuildInputs = with pkgs; [
    gcc
    makeWrapper
    libGL
    mesa
    libgcc
  ];

  LD_LIBRARY_PATH="/run/opengl-driver/lib:/run/opengl-driver-32/lib";

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
    --set LD_LIBRARY_PATH $LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [pkgs.glfw pkgs.wayland pkgs.libGL pkgs.gcc]}:${pkgs.stdenv.cc.cc.lib}/lib 
    '';
  
  # use command:
  # nix-build
}

