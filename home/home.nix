{ config, pkgs, ... }:

{
  home.username = "emmie";
  home.homeDirectory = "/home/emmie";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Emmie";
    userEmail = "98668340+emolucy@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    }
  };
}
