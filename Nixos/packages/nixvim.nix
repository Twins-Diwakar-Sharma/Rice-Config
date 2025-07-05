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
        action.__raw = '' function() require('telescope.builtin').live_grep({
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              prompt_position = "top",
              mirror = true,
            },
            preview_cutoff = 0,
          },
        }) end '';
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
      {
        action.__raw = '' function()
            local new_config = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config({ virtual_lines = new_config })
          end'';
        key = "<leader>we";
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
      
      lsp-lines = {
        enable = true;
      };

    }; # end of plugins

    diagnostic.settings = {
      virtual_lines = true;
      virtual_text = false;
    };

  }; # end of nixvim

}
