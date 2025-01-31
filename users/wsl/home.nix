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

  programs.git.extraConfig.core.autocrlf = true;
  # programs.nixvim.plugins.lsp.servers.delphi_ls.enable = true;
  programs.bash.initExtra = ''
    src=/mnt/c/Users/Jack.Neilson/source/;
    doc=/mnt/c/Users/Jack.Neilson/Documents/;
  '';
}
