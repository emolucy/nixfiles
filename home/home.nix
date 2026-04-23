{ config, pkgs, ... }:

{
  imports = [ ./neovim.nix ];

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

  catppuccin.flavor = "macchiato";

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

  catppuccin.fish.enable = true;

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    prefix = "C-Space";
    escapeTime = 0;
    mouse = true;
    keyMode = "vi";
    historyLimit = 50000;
    focusEvents = true;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
    ];
    extraConfig = builtins.readFile ./tmux/tmux.conf;
  };

  catppuccin.tmux.enable = true;

  programs.starship = {
    enable = true;
    presets = [ "bracketed-segments" ];
    settings = {
      character = {
        success_symbol = "[](green)";
        error_symbol = "[](red)";
      };
    };
  };

  catppuccin.starship.enable = true;

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."github.com" = {
      identityFile = "~/.ssh/id_ed25519";
    };
  };

  programs.rofi.enable = true;

  catppuccin.rofi.enable = true;

  programs.ghostty = {
    enable = true;
    package = null;
    systemd.enable = false;
    settings = {
      font-family = "FiraMono Nerd Font";
    };
  };

  catppuccin.ghostty.enable = true;
  
  fonts.fontconfig.enable = true;
  xdg.configFile."fontconfig/conf.d/10-hm-fonts.conf".force = true;

  home.packages = with pkgs; [
    fastfetch
    inter
    maple-mono.NL-NF
    nerd-fonts.fira-mono
  ];
}
