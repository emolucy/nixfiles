{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [

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
