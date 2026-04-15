{ config, pkgs, ... }:

{
  home.username = "emmie";
  home.homeDirectory = "/home/emmie";

  # dont change this
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;
}
