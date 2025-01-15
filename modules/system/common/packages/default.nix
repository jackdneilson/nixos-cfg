{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    ripgrep
    fd
    fzf
    killall
    tree
  ];
}
