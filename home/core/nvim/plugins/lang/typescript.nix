{ config, ...}:{
  programs.nixvim = {
    plugins = {
      typescript-tools = {
        enable = true;
      };

      lsp.servers.tsserver = {
        enable = true;
      };

      treesitter = {
        grammarPackages = [
          config.programs.nixvim.plugins.treesitter.package.builtGrammars.typescript
        ];
      };
    };
  };
}
