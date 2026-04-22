{ config, pkgs, ... }:

{
  home.username = "emmie";
  home.homeDirectory = "/home/emmie";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = false;
    desktop = "${config.home.homeDirectory}/store/misc/desktop";
    download = "${config.home.homeDirectory}/dl/net";
    documents = "${config.home.homeDirectory}/store/doc/xdg";
    music = "${config.home.homeDirectory}/store/audio";
    pictures = "${config.home.homeDirectory}/store/image";
    videos = "${config.home.homeDirectory}/store/video";
    templates = "${config.home.homeDirectory}/store/misc/template";
    publicShare = "${config.home.homeDirectory}/dl/public";
    projects = null;
   };

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
  
  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight";
    subpixelRendering = "rgb";
  };

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-hint-font-metrics = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
      gtk-xft-antialias = 1;
    };
  };

  home.packages = with pkgs; [
    fastfetch
    inter
  ];
}
