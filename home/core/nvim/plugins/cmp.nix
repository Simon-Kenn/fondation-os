{
  programs.nixvim.plugins = {
    luasnip = {
      enable = true;
      extraConfig = {
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
    
    cmp = {
      enable = true;
      settings = {
        snippet.expand = "luasnip";
        sources = [
          {name = "nvim_lsp";}
          {name = "nvim-lua";}
          {name = "luasnip";}
          {name = "path";}
          {name = "neorg";}
          {
            name = "buffer";
            keywordLength = 5;
          }
        ];
        mapping = {
          "<CR>" =
            /*
            lua
            */
            ''
                cmp.mapping(function(fallback)
                  if cmp.visible() then
                      if luasnip.expandable() then
                          luasnip.expand()
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
              cmp.mapping(function(fallback)
                 if cmp.visible() then
                   cmp.select_next_item()
                 --elseif luasnip.expandable() then
                 --  luasnip.expand()
                 --elseif luasnip.expand_or_jumpable() then
                 --  luasnip.expand_or_jump()
                else
                    fallback()
                end
              end, { "i", "s" })
            '';
          "<S-Tab" =
            /*
            lua
            */
            ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                --elseif luasnip.locally_jumpable(-1) then
                --  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
        };
      };
    };
  };
}
