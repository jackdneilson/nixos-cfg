{ config, pkgs, ... }:

{
  home.username = "jack";
  home.homeDirectory = "/home/jack";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
