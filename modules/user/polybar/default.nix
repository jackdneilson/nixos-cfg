{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      pulseSupport = true;
    };
    script = "polybar bar &";
    config = ./polybar.ini;
  };
}
