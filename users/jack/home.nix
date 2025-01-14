{ ... }:

{
  imports = [
    ../../modules/nvim
    ../../modules/git
    ../../modules/ghostty
    ../../modules/rofi
    ../../modules/yazi
    ../../modules/polybar
    # ../../modules/udiskie { inherit pkgs; }
    # ../../modules/gtk { inherit pkgs; }
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
  
  # services.polybar = {
  #   enable = true;
  #   package = pkgs.polybar.override {
  #     pulseSupport = true;
  #   };
  #   script = "polybar bar &";
  #   config = ./polybar.ini;
  # };
}
