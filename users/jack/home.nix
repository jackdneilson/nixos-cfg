{ ... }:

{
  imports = [
    ../../modules/nvim
    ../../modules/git
    ../../modules/ghostty
    ../../modules/rofi
    ../../modules/yazi
    ../../modules/polybar
    ../../modules/udiskie
    ../../modules/gtk
  ];

  home.username = "jack";
  home.homeDirectory = "/home/jack";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}
