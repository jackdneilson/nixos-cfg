{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false;
    windowManager.i3.enable = true;
    xkb = {
      layout = "gb";
      variant = "";
      options = "caps:escape";
    };
  };

  environment.systemPackages = with pkgs; [
    firefox
    rofi
    bitwarden-desktop
    libreoffice
    udiskie
    xclip
  ];

  # Required for GTK
  programs.dconf.enable = true;

  # Compositor for transparency
  # services.picom = {
  #   enable = true;
  #   # Need to figure out how to get the gfx card to run picom with glx backend
  #   # backend = "glx";
  # };

  # udisks2 handles (un)mounting disks
  services.udisks2.enable = true;
}
