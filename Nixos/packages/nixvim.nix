{ args, config, lib, pkgs, ... }:

{
  
  imports = [
    args.nixvim.nixosModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    enableMan = true;

    clipboard = {
      #providers.xclip.enable = true;
      providers.wl-copy.enable = true;
    };
    
    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      autoindent = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      clipboard = "unnamedplus";
    };

    colorschemes.ayu = {
      enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
    ];

    keymaps = [
      {
        action = ":NvimTreeToggle<CR>";
        key = "<C-n>";
        options.silent = true;
        mode = "n";
      }
      {
        action = ":CclsSwitchSourceHeader<CR>";
        key = "<leader>hs";
        options.silent = true;
        mode = "n";
      }
      {
        action = "<cmd>Telescope live_grep<cr>";
        key = "<leader>fw";
        options.silent = true;
        mode = "n";
      }
      {
        action = "<cmd>Telescope find_files<cr>";
        key = "<leader>ff";
        options.silent = true;
        mode = "n";
      }
      {
        action = "<cmd>Telescope colorscheme<cr>";
        key = "<leader>th";
        options.silent = true;
        mode = "n";
      }
    ];

    plugins = {
      lualine = {
        enable = true; 
        settings.options.theme = "horizon";
      };


      nvim-tree = {
        enable = true; 
        disableNetrw = true;
        openOnSetup = true;
      };

      treesitter = {
          enable = true;

          grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
            make
            markdown
            cmake
            c
            cpp
            glsl
          ];
      };

      lsp = {
        enable = true;

        servers = {
            ccls.enable = true;
        };
      };


      flutter-tools = {
        enable = true;
        settings = {
          widget_guides = {
            enabled = true;
          };
          closing_tags = {
            highlight = "Comment";
          };
          lsp = {
            color.enabled = true;
          };
        };
      };



      telescope = {
        enable = true;
        extensions = {
          live-grep-args = {
            enable = true;
          };
          fzf-native = {
            enable = true;
          };
        };
        settings = {
          pickers = {
            colorscheme = {
              theme = "dropdown";
            };
          };
        };
      };


    }; # end of plugins

  }; # end of nixvim

}
