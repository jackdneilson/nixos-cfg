{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    globals.loaded_netrwPlugin = 1;
    globals.loaded_netrw = 1;
    performance.byteCompileLua.enable = true;
    colorschemes.nightfox = {
      enable = true;
      flavor = "carbonfox";
      # settings.palettes.all.bg1 = "#000000";
    };
    opts = import ./options.nix;
    keymaps = import ./keymaps.nix;
    plugins = import ./plugins.nix;
  };
}
