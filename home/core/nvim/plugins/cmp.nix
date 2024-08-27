{
  programs.nixvim = {
    plugins = {
      luasnip = {
        enable = true;
        settings = {
          history = true;
          updateevents = "TextChanged,TextChangedI";
          enable_autosnippets = true;
        };
        fromLua = [
          {}
          {
            paths = ./snippets;
          }
        ];
      };

      lspkind = {
        enable = true;

        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            neorg = "[neorg]";
            cmp_tabby = "[Tabby]";
          };
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = false;
        settings = {
          snippet.expand = /*lua*/ ''
            function(args) 
              require('luasnip').lsp_expand(args.body) 
            end
          '';

            sources ={ 
            __raw = /*lua*/ ''
            cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "luasnip" },
              { name = "buffer" },
              { name = "path" },
              { name = "neorg" },
              { name = "vimtex" },
              { name = "bashls" },
              { name = "lua_ls" },
              { name = "nil_ls" },
            }),



            '';
            };

          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            #"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            #"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            #"<CR>" = "cmp.mapping.confirm({ select = true })";
            "<CR>" =
              /*
              lua
              */
              ''
                cmp.mapping(function(fallback)
                  if cmp.visible() then
                    if require("luasnip").expandable() then
                      require("luasnip").expand()
                    else
                      cmp.confirm({
                        select = true,
                      })
                    end
                  else
                    fallback()
                  end
                end)
              '';
            "<Tab>" =
              /*
              lua
              */
              ''
                cmp.mapping(
                  function(fallback)
                    if cmp.visible() then
                      cmp.select_next_item()
                    elseif require("luasnip").locally_jumpable(1) then
                      require("luasnip").jump(1)
                    else
                      fallback()
                    end
                  end,
                  { "i", "s" }
                  )
              '';
            "<S-Tab" =
              /*
              lua
              */
              ''
                cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif require("luasnip").locally_jumpable(-1) then
                    require("luasnip").jump(-1)
                  else
                    fallback()
                  end
                end, { "i", "s" })
              '';
          };
        };
      };

      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp_luasnip.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-spell.enable = true;

    };
  };
}
