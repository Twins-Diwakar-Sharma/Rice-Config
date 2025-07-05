{ args, config, lib, pkgs,  home-manager, ... }:

{

  imports = [
    args.home-manager.nixosModules.home-manager
  ];



  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  environment.systemPackages =
  let
    hexeon = (pkgs.callPackage ../customPackages/hexeon/default.nix {inherit pkgs;} ) ;
  in
  [
    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    pkgs.foot
    pkgs.tofi # backup if hexeon fails
    pkgs.hyprpaper
    pkgs.wl-clipboard
    hexeon
    pkgs.hyprshot # screenshot
    pkgs.lf # file explorer
    pkgs.chafa # image previewer for lf
  ];

  home-manager.useGlobalPkgs = true;


  home-manager.sharedModules = [{
    wayland.windowManager.hyprland = { 
      enable = true; 
      systemd.enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = [

          # workspace
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"
          #workspace move
          "$mod SHIFT, 1, movetoworkspacesilent, 1"
          "$mod SHIFT, 2, movetoworkspacesilent, 2"
          "$mod SHIFT, 3, movetoworkspacesilent, 3"
          "$mod SHIFT, 4, movetoworkspacesilent, 4"
          "$mod SHIFT, 5, movetoworkspacesilent, 5"
          "$mod SHIFT, 6, movetoworkspacesilent, 6"
          "$mod SHIFT, 7, movetoworkspacesilent, 7"
          "$mod SHIFT, 8, movetoworkspacesilent, 8"
          "$mod SHIFT, 9, movetoworkspacesilent, 9"
          "$mod SHIFT, 0, movetoworkspacesilent, 10"
          #window focus
          "$mod, h, movefocus, l"
          "$mod, j, movefocus, d"
          "$mod, k, movefocus, u"
          "$mod, l, movefocus, r"
          #window move
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, j, movewindow, d"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, l, movewindow, r"
          #resize window
          "$mod ALT, h, resizeactive, -160 0"
          "$mod ALT, l, resizeactive, 160 0"
          "$mod ALT, k, resizeactive, 0 -160"
          "$mod ALT, j, resizeactive, 0 160"


          "$mod, Return, exec, foot"
          "$mod SHIFT, t, exec, tofi-drun --drun-launch=true"
          "$mod, d, exec, hexeon"
          ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +2%"
          ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -2%"
          ", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"
          "$mod SHIFT ALT, x, exec, hyprctl dispatch exit"

          "$mod, F, fullscreen"
        ];

        windowrulev2 = [
          "noborder, title:(hexeon)"
          "noblur, title:(hexeon)"
          "noshadow, title:(hexeon)"
          "noborder, title:(Hex)"
          "noblur, title:(Hex)"
          "noshadow, title:(Hex)"
        ];
      };

    };

    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "DaddyTimeMono Nerd Font Mono:size=12";
        };
        colors = {
          alpha = 0.8;
        };
      };
    };

 
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "~/.background.png" ];
        wallpaper = [ " , ~/.background.png " ];
      };
    };


    home.file.".config/lf/preview.sh" = { 
      text = ''
      #!/bin/sh
      case "$1" in
        *.tar*) tar tf "$1";;
        *.zip) unzip -l "$1";;
        *.jpg) chafa "$1" --size="$2"x"$3";;
        *.jpeg) chafa "$1" --size="$2"x"$3";;
        *.png) chafa "$1" --size="$2"x"$3";;
        *) cat "$1";;
      esac
          '';
      executable = true;
      enable = true;
    };

    programs.lf = {
      enable = true;

      settings = {
        drawbox = true;
        icons = true;
        preview = true;
      };
      
      extraConfig = ''
        # Basic Settings
        set ignorecase true
        set icons true
        set preview true
        set sixel true

        set previewer ~/.config/lf/preview.sh
      '';
     
    };

    # waybar dont remove waybar
    imports = [ ./waybar.nix ]; 
    
  }];

}
