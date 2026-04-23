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

    extraLuaConfig = builtins.concatStringsSep "\n" [
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
