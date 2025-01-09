{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # NixOS Configuration
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than +5";
  };
  nix.settings.auto-optimise-store = true;
  system.stateVersion = "24.11";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;

  # Add support for virtualisation
  virtualisation.vmware.guest.enable = true;

  # Networking
  networking.hostName = "dev-vm"; 
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Localisation
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  console.keyMap = "uk";

  # Enable the X11 windowing system and i3
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    windowManager.i3.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jack = {
    isNormalUser = true;
    description = "Jack Neilson";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    ripgrep
    fd
    fzf
    killall
    ghostty
    firefox
    rofi
    bitwarden-desktop
    libreoffice
    pavucontrol
    spotify
    spotify-tray
    udiskie
  ];

  # Programs with Options
  # dconf required to provide GSettings
  programs.dconf.enable = true;

  # ssh-agent autostart for auth
  programs.ssh.startAgent = true;

  # nvim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Services
  # picom is a compositor that allows for transparency and blurring.
  services.picom = {
    enable = true;
    #backend = "glx";
    shadow = true;
    inactiveOpacity = 0.5;
    opacityRules = [
      "100:class_g *?= 'Rofi'"
    ];
  };

  # udisks2 handles (un)mounting disks
  services.udisks2.enable = true;
}
