{ config, pkgs, ... }:

{
  home.username = "emmie";
  home.homeDirectory = "/home/emmie";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "Emmie";
      user.email = "98668340+emolucy@users.noreply.github.com";
      init.defaultBranch = "main";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."github.com" = {
      identityFile = "~/.ssh/id_ed25519";
    };
  };


  home.packages = with pkgs; [
    fastfetch
  ];
}
