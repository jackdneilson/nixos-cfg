{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";
    # performance.byteCompileLua.enable = true;
    colorschemes.nightfox = {
      enable = true;
      flavor = "carbonfox";
      # settings.palettes.all.bg1 = "#000000";
    };
    opts = import ./options.nix;
    keymaps = import ./keymaps.nix;
    plugins = import ./plugins.nix;
    autoCmd = import ./autocmd.nix;
  };
}
