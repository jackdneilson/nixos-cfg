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
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
      }
      {
        mode = "n";
        key = "<leader>fv";
        action = "<cmd>Telescope file_browser<CR>";
      }
    ];
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
        };
      };

      # indent-blankline.enable = true;
      lz-n.enable = true;
      nvim-surround.enable = true;
      undotree.enable = true;
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      fugitive.enable = true;
      which-key.enable = true;

      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
        extensions.file-browser = {
          enable = true;
          settings = {
            hijack_netrw = true;
          };
        };
      };

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };
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
