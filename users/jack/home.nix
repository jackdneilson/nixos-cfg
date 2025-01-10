{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim 
  ];

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
      theme = "carbonfox";
      background-opacity = "0.8";
      background = "#000000";
      gtk-tabs-location = "hidden";
      gtk-titlebar = false;
      gtk-adwaita = false;
    };
  };

  programs.rofi = {
    enable = true;
    theme = ./theme.rasi;
    terminal = "ghostty";
  };

  programs.yazi.enable = true;

  programs.nixvim = {
    enable = true;
    colorschemes.nightfox = {
      enable = true;
      flavor = "carbonfox";
    };
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
    };
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>u";
        action = "<cmd>UndotreeToggle<CR>";
      }
    ];

    plugins.nvim-surround.enable = true;
    plugins.undotree.enable = true;
    plugins.telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
    };
  };

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
