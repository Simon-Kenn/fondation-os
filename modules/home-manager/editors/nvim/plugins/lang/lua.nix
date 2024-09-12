{config, pkgs, inputs, ...}: {
  home.file.".config/nvim/lua/config/lua-lsp.lua".source = ./lua-lsp.lua;

  programs.nixvim =  {
    plugins = {
      lsp.servers.lua-ls = {
        enable = true;
      };

      treesitter = {
        grammarPackages = [
          config.programs.nixvim.plugins.treesitter.package.builtGrammars.lua
        ];
      };
    };

    extraConfigLua = ''
      require('lspconfig').lua_ls.setup{
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true)
            },
          },
        },
      }
    '';
  };
}
