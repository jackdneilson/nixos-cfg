{ config, pkgs, ... }:

{
  home.username = "jack";
  home.homeDirectory = "/home/jack";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Jack Neilson";
    userEmail = "jackdneilson@gmail.com";
  };

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "carbonfox";
      window-decoration = "false";
      background = "#000000";
    };
  };

  programs.rofi = {
    enable = true;
    theme = ./theme.rasi;
    terminal = "ghostty";
  };

  programs.yazi.enable = true;

  services.udiskie.enable = true;
  services.udiskie.tray = "never";

  gtk = {
    enable = true;
    theme = {
      package = (pkgs.callPackage ./carbonfox.nix {});
      name = "Carbonfox-Dark-Carbon";
    };
    iconTheme = {
      package = pkgs.iconpack-obsidian;
      name = "Obsidian-Teal";
    };
  };
}
