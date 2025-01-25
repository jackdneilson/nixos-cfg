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
    ../../modules/user/dropbox
  ];

  home.username = "jack";
  home.homeDirectory = "/home/jack";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  programs.bash.initExtra = ''PS1="\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h \W]\$\[\033[0m\] "'';

  systemd.user.targets.tray = {
    Unit = {
      Description = "Home Manager System Tray";
      Requires = [ "graphical-session-pre.target" ];
    };
  };
}
