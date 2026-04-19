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

  home.packages = with pkgs; [
    (maven.override { jdk_headless = jdk23.override { enableJavaFX = true; }; })
  ];
}
