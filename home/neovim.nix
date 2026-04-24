{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;

    plugins = with pkgs.vimPlugins; [
      # treesitter
      (nvim-treesitter.withPlugins (p: [
        p.bash
        p.c
        p.cpp
        p.css
        p.html
        p.javascript
        p.json
        p.lua
        p.nix
        p.rust
        p.tsx
        p.typescript
        p.vim
        p.vimdoc
      ]))

      # lsp
      nvim-autopairs
      nvim-lspconfig
      conform-nvim

      {
        plugin = vimtex;
        type = "lua";
        config = ''
          vim.g.vimtex_view_method = "zathura"
          vim.g.vimtex_compiler_method = "latexmk"
          vim.g.vimtex_mappings_enabled = 0
          vim.g.vimtex_imaps_enabled = 0
        '';
      }

      # ui
      nvim-web-devicons
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile ./nvim/plugin/nvim-tree.lua;
      }
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = builtins.readFile ./nvim/plugin/bufferline.lua;
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = builtins.readFile ./nvim/plugin/lualine.lua;
      }
      {
        plugin = barbecue-nvim;
        type = "lua";
        config = builtins.readFile ./nvim/plugin/barbecue.lua;
      }

      # completion
      {
        plugin = blink-cmp;
        type = "lua";
        config = builtins.readFile ./nvim/plugin/blink.lua;
      }
      {
        plugin = luasnip;
        type = "lua";
        config = ''
              require("luasnip").config.setup({
            enable_autosnippets = true,
            store_selection_keys = "<Tab>",
          })
        '';
      }
      luasnip-latex-snippets-nvim

      # utils
      bufdelete-nvim
      vim-tmux-navigator
      nvim-navic
    ];

    # lsps and formatters
    extraPackages = with pkgs; [
      # nix
      nil
      nixfmt

      # lua
      lua-language-server
      stylua

      # latex
      texlab
    ];

    initLua = builtins.concatStringsSep "\n" [
      (builtins.readFile ./nvim/options.lua)
      (builtins.readFile ./nvim/keymaps.lua)
      (builtins.readFile ./nvim/autocmds.lua)
      (builtins.readFile ./nvim/treesitter.lua)
      (builtins.readFile ./nvim/lsp.lua)
      (builtins.readFile ./nvim/formatting.lua)
      ''
        require("nvim-autopairs").setup({})
      ''
    ];
  };

  catppuccin.nvim = {
    enable = true;
    settings = {
      styles = {
        comments = [ "italic" ];
        conditionals = [ "italic" ];
      };
      integrations = {
        bufferline = true;
        nvimtree = true;
        barbecue = {
          dim_dirname = true;
          bold_basename = true;
          dim_context = false;
        };
        native_lsp = {
          enabled = true;
        };
      };
    };
  };
}
