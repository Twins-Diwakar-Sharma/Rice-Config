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
      },
      {
        action = ":CclsSwitchSourceHeader<CR>";
        key = "<leader>hs";
        options.silent = true;
        mode = "n";
      }
    ];

    plugins = {
      lualine = {
        enable = true; 
        theme = "horizon";
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


    }; # end of plugins

  }; # end of nixvim

}
