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
      # language stuff
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

      nvim-autopairs
      nvim-lspconfig
      conform-nvim

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
      #barbecue-nvim
      #nvim-navic

      # utils
      bufdelete-nvim
      vim-tmux-navigator
    ];

    # lsps and formatters
    extraPackages = with pkgs; [
      # nix
      nil
      nixfmt

      # lua
      lua-language-server
      stylua
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
