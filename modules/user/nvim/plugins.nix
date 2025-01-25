{
  lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      html.enable = true;
      emmet_ls.enable = true;
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
  emmet.enable = true;

  # Autocompletion
  cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "luasnip"; }
      ];
      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-e>" = "cmp.mapping.close()";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
      };
    };
  };

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
