{
  programs.nixvim = {
    plugins = {
      typescript-tools = {
        enable = true;
      };

      lsp.servers.tsserver = {
        enable = true;
      };
    };
  };
}
