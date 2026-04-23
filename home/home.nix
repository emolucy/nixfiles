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

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
    functions = {
      hms = ''
        git add .
        git commit -m "$argv[1]"
        home-manager switch --flake .
      '';
    };
  };

  programs.starship = {
    enable = true;
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

  programs.ghostty = {
    enable = true;
    package = null;
    systemd.enable = false;
    settings = {
      font-family = "Maple Mono NL NF";
      theme = "Catppuccin Macchiato";
    };
  };
  
  fonts.fontconfig.enable = true;
  xdg.configFile."fontconfig/conf.d/10-hm-fonts.conf".force = true;

  home.packages = with pkgs; [
    fastfetch
    inter
    maple-mono.NL-NF
  ];
}
