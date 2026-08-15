
{ args, config, lib, pkgs,  home-manager, ... }:

{
  imports = [
    args.home-manager.nixosModules.home-manager
  ];
  
  ##NOTE all other packages are in hyprland file :/ need to refactor
  programs.niri = {
    enable = true;
  };

  home-manager.sharedModules = [{ 
    
    home.file.".config/niri/config.kdl" = {
      text = ''
        prefer-no-csd
        input {
          keyboard {
            xkb {
              layout "us"
            }
          }
          touchpad {
            tap
            natural-scroll
          }
          mouse {
          }
        }

        cursor {
          xcursor-theme "oreo-cursors-plus"
          xcursor-size 16
        }

        layout {
          gaps 8
          center-focused-column "never"
          always-center-single-column
          empty-workspace-above-first
          default-column-display "tabbed"
          focus-ring {
            //off
            width 2
            //active-color "#ddddff"
            //inactive-color "#333366"
            active-gradient from="#f41616" to="#f4f416" angle=45 relative-to="workspace-view"
            inactive-gradient from="#666666" to="#000000" angle=45 relative-to="workspace-view" in="srgb-linear"
          }
          shadow {
            off
          }
          tab-indicator {
            // off
            on
            hide-when-single-tab
            place-within-column
            gap 5
            width 4
            length total-proportion=1.0
            position "right"
            gaps-between-tabs 2
            corner-radius 8
            active-color "red"
            inactive-color "gray"
            urgent-color "blue"
            // active-gradient from="#80c8ff" to="#bbddff" angle=45
            // inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
            // urgent-gradient from="#800" to="#a33" angle=45
          }

        }
        
        window-rule {
          match title="hexeon"
          draw-border-with-background false
          focus-ring {
            off
          }
          border {
            off
          }
          shadow {
            off
          }
        }

        binds {
          Mod+Shift+Slash { show-hotkey-overlay; }

          // window motions
          Mod+O repeat=false { toggle-overview; }
          Mod+Q repeat=false { close-window; }

          Mod+F { maximize-column; } 

          Mod+H { focus-column-left; }
          Mod+L { focus-column-right; }
          Mod+J { focus-workspace-down; }
          Mod+K { focus-workspace-up; }

          Mod+Shift+H { move-column-left; }
          Mod+Shift+J { move-column-to-workspace-down; }
          Mod+Shift+K { move-column-to-workspace-up; }
          Mod+Shift+L { move-column-right; }

          Mod+Alt+J { move-window-down; }
          Mod+Alt+K { move-window-up; }

          Mod+BracketLeft  { consume-or-expel-window-left; }
          Mod+BracketRight { consume-or-expel-window-right; }

          // Consume one window from the right to the bottom of the focused column.
          Mod+Comma  { consume-window-into-column; }
          // Expel the bottom window from the focused column to the right.
          Mod+Period { expel-window-from-column; }

          // Cycle through widths set in preset-column-widths.
          Mod+R { switch-preset-column-width; }

          Mod+Minus { set-column-width "-10%"; }
          Mod+Equal { set-column-width "+10%"; }
                // Finer height adjustments when in column with other windows.
          Mod+Shift+Minus { set-window-height "-10%"; }
          Mod+Shift+Equal { set-window-height "+10%"; }

          // Move the focused window between the floating and the tiling layout.
          Mod+V       { toggle-window-floating; }
          Mod+Shift+V { switch-focus-between-floating-and-tiling; }

          // Toggle tabbed column display mode.
          // Windows in this column will appear as vertical tabs,
          // rather than stacked on top of each other.
          Mod+T { toggle-column-tabbed-display; } 


          // apps
          Mod+D hotkey-overlay-title="Run app launcher: hexeon" repeat=false { spawn "hexeon"; }
          Mod+Return hotkey-overlay-title="Open terminal: foot" repeat=false { spawn "foot"; }

          // others
          Mod+Alt+Shift+X { quit; }
          XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
          XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
          XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }
          XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
          XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }


        }

      '';
      #executable = true;
      enable = true;

    };
  }];
}
