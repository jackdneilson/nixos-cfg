{ pkgs, ... }:

{
  services.udiskie = {
    enable = true;
    notify = false;
    tray = "auto";
    automount = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.alacritty}/bin/alacritty -e yazi";
      };
    };
  };
}
