{
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
  };

  treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };

  yazi = {
    enable = true;
    settings = {
      enable_mouse_support = true;
      open_for_directories = true;
    };
  };
}
