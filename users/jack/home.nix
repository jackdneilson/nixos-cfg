{ ... }:

{
  imports = [
    ../../modules/user/nvim
    ../../modules/user/git
    ../../modules/user/wezterm
    ../../modules/user/rofi
    ../../modules/user/yazi
    ../../modules/user/polybar
    ../../modules/user/udiskie
    ../../modules/user/gtk
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
