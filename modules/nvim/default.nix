{
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    performance.byteCompileLua.enable = true;
    colorschemes.nightfox = {
      enable = true;
      flavor = "carbonfox";
    };
    opts = import ./options.nix;
    keymaps = import ./keymaps.nix;
    plugins = import ./plugins.nix;
  };
}
