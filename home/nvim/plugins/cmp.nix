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
          "<CR>" = "cmp.mapping.confirm({ select = false })";
          "<Tab>" =
            /*
            lua
            */
            ''
              cmp.mapping(
                function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.expandable() then
                    luasnip.expand()
                  elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                  elseif check_backspace() then
                    fallback()
                  else
                    fallback()
                  end
                end,
                { "i", "s" }
              )
            '';
        };
      };
    };
  };
}
