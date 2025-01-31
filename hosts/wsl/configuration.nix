{ config, lib, pkgs, ... }:

{
  system.stateVersion = "24.05";
  networking.hostName = "wsl";

  wsl.enable = true;
  wsl.defaultUser = "jack";
  wsl.interop.includePath = false;
  wsl.wslConf.interop.enabled = false;
  wsl.wslConf.interop.appendWindowsPath = false;

  # wsl.wslConf.automount.disabled

  programs.ssh.startAgent = true;
}
