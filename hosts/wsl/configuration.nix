{ config, lib, pkgs, ... }:

{
  system.stateVersion = "24.05";
  networking.hostName = "wsl";

  wsl.enable = true;
  wsl.defaultUser = "jack";

  programs.ssh.startAgent = true;
}
