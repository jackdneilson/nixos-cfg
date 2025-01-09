{ config, pkgs, ... }:

{
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

  programs.git = {
    enable = true;
    userName = "Jack Neilson";
    userEmail = "jackdneilson@gmail.com";
  };

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "oxocarbon-dark";
      background-opacity = "0.8";
      background = "#000000";
      gtk-tabs-location = "hidden";
      gtk-titlebar = false;
      gtk-adwaita = false;
    };
    themes = {
      oxocarbon-dark = {
        background = "161616";
        foreground = "f2f4f8";

        selection-background = "393939";
        selection-foreground = "161616";

        palette = [
          "0=#161616"
          "1=#3ddbd9"
          "2=#33b1ff"
          "3=#ee5396"
          "4=#42be65"
          "5=#be95ff"
          "6=#ff7eb6"
          "7=#f2f4f8"
          "8=#525252"
          "9=#3ddbd9"
          "10=#33b1ff"
          "11=#ee5396"
          "12=#42be65"
          "13=#be95ff"
          "14=#ff7eb6"
          "15=#08bdba"
          "16=#78a9ff"
          "17=#82cfff"
          "18=#262626"
          "19=#393939"
          "20=#dde1e6"
          "21=#ffffff"
        ];
      };
    };
  };

  programs.rofi = {
    enable = true;
    theme = ./theme.rasi;
    terminal = "ghostty";
  };

  programs.yazi.enable = true;

  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      pulseSupport = true;
    };
    script = "polybar bar &";
    config = ./polybar.ini;
  };

  services.udiskie = {
    enable = true;
    notify = false;
    tray = "auto";
    automount = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.ghostty}/bin/ghostty -e yazi";
      };
    };
  };

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
