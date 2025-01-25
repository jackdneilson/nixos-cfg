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

  luasnip = {
    enable = true;
  };

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
        "<CR>" = ''
          cmp.mapping(function(fallback)
            local luasnip = require('luasnip')
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({select = true})
              end
            else
              fallback()
            end
          end)
        '';
        "<Tab>" = ''
          cmp.mapping(function(fallback)
            local luasnip = require('luasnip')
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end,
          { "i", "s" })
        '';
        "<S-Tab>" = ''
          cmp.mapping(function(fallback)
            local luasnip = require('luasnip')
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, 
          { "i", "s" })
        '';
      };
      snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
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
      # indent.enable = true;
    };
  };

  conform-nvim = {
    enable = true;
    settings.format_on_save = {
      lsp_format = "fallback";
    };
    settings.default_format_opts.lsp_format = "fallback";
  };

  yazi = {
    enable = true;
    settings = {
      enable_mouse_support = true;
      open_for_directories = true;
    };
  };
}
