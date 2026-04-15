{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.extraEntries = ''
    menuentry "Windows" {
        search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
        chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
    }
  '';
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = false;

  # kde plasma
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  # keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.emmie = {
    isNormalUser = true;
    description = "emmie";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # programs
  programs.firefox.enable = true;
  programs._1password.enable = true;
  programs._1password-gui.enable = true;
  programs.fish.enable = true;
  users.users.emmie.shell = pkgs.fish;
  programs.nix-ld.enable = true;
  programs.neovim.enable = true;
  programs.git = {
    enable = true;
    config = {
      user.name = "Emmie";
      user.email = "98668340+emolucy@users.noreply.github.com";
    };
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    wget
    curl
    unzip
    htop
    discord
    ghostty
    tmux
    nodejs
    neofetch
    gcc
    jdk21
    python3
    spotify
    cargo
    rustc
    gradle
  ];

  fonts.packages = [
    pkgs.maple-mono.NL-NF
  ];

  # dont change
  system.stateVersion = "25.11";

}
