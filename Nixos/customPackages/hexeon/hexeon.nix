



{ inputs, config, lib, pkgs,  ... }:
let
  cfg = config.programs.hexeon;
  color = {
    options = {
      r = lib.mkOption {
        type = lib.types.ints.between 0 255;
        description = "color red";
      };
      g = lib.mkOption {
        type = lib.types.ints.between 0 255;
        description = "color green";
      };
      b = lib.mkOption {
        type = lib.types.ints.between 0 255;
        description = "color blue";
      };
    };
  };

in
{
  options.programs.hexeon = {

      enable = lib.mkEnableOption "hexeon";

      icon = lib.mkOption {
        type = lib.types.enum [ "none" "color" "neon" ];
        default = "neon";
        description = ''
          a string representing style of icons
          none = no icon will be displayed
          neon = icons will be displayed in neon sign like style (oooooooh)
          color = default full color icon will be displayed (boring)
        '';
      };

      insertColor = lib.mkOption {
        description = ''
          border color of middle hexagon in insert mode
          an attribute set, containing 3 ints in range 0 to 255 for value of:
          red (r), green (g) and blue (b)
        '';
        type = with lib.types; submodule color;
        default = { r=15; g=211; b=201; };
      };

      visualColor = lib.mkOption {
        description = ''
          fill color of outer hexagons in visual mode
          an attribute set, containing 3 ints in range 0 to 255 for value of:
          red (r), green (g) and blue (b)
        '';
        type = with lib.types; submodule color;
        default = { r=255; g=100; b=0; };
      };

      disabledColor = lib.mkOption {
        description = ''
          border color all not selected hexagons 
          an attribute set, containing 3 ints in range 0 to 255 for value of:
          red (r), green (g) and blue (b)
        '';
        type = with lib.types; submodule color;
        default = { r=2; g=2; b=2; };
      };

      textColor = lib.mkOption {
        description = ''
          text color of middle hexagon in insert mode
          an attribute set, containing 3 ints in range 0 to 255 for value of:
          red (r), green (g) and blue (b)
        '';
        type = with lib.types; submodule color;
        default = { r=15; g=211; b=201; };
      };

      selectedTextColor = lib.mkOption {
        description = ''
          text color of selected hexagon in visual mode
          an attribute set, containing 3 ints in range 0 to 255 for value of:
          red (r), green (g) and blue (b)
        '';
        type = with lib.types; submodule color;
        default = { r=0; g=0; b=0; };
      };
  };
  
  config = lib.mkIf cfg.enable {
    home.file.".config/hexeon/config".text =
    ''
insertColor = ${toString cfg.insertColor.r} ${toString cfg.insertColor.g} ${toString cfg.insertColor.b}
visualColor = ${toString cfg.visualColor.r} ${toString cfg.visualColor.g} ${toString cfg.visualColor.b}
disabledColor = ${toString cfg.disabledColor.r} ${toString cfg.disabledColor.g} ${toString cfg.disabledColor.b}
textColor = ${toString cfg.textColor.r} ${toString cfg.textColor.g} ${toString cfg.textColor.b}
selectedTextColor = ${toString cfg.selectedTextColor.r} ${toString cfg.selectedTextColor.g} ${toString cfg.selectedTextColor.b}
icon = ${cfg.icon}
    '';
  };

}
