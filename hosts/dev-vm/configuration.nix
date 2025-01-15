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

  # Add support for virtualisation
  virtualisation.vmware.guest.enable = true;

  # Networking
  networking.hostName = "dev-vm"; 
  networking.networkmanager.enable = true;

  # ssh-agent autostart for auth
  programs.ssh.startAgent = true;
}
