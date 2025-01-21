{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  system.stateVersion = "24.11";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "lamb"; 
  networking.networkmanager.enable = true;

  # Start the ssh agent on boot
  programs.ssh.startAgent = true;

  # Make PDFs open in Firefox
  xdg.mime = {
    enable = true;
    defaultApplications = {
      "application/pdf" = "firefox.desktop";
    };
  };
}
