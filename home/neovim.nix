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
    ];
  };

  catppuccin.nvim = {
    enable = true;
    settings = {
      styles = {
        comments = [ "italic" ];
	      conditionals = [ "italic" ];
      };
    };
  };
}
