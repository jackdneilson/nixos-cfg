{ ... }:

{
  imports = [
    ../../modules/user/nvim
    ../../modules/user/git
    ../../modules/user/yazi
  ];

  home.username = "jack";
  home.homeDirectory = "/home/jack";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
