{
  pkgs,
  config,
  ...
}: {
  programs.nixvim = {
    plugins = {
      nix.enable = true;
      hmts.enable = true;

      conform-nvim = {
        settings = {
          formattersByFt = {
            nix = ["alejandra"];
          };
          formatters = {
            alejandra = {
              command = "${pkgs.alejandra}/bin/alejandra";
            };
          };
        };
      };

      lint = {
        lintersByFt = {
          nix = ["statix"];
        };
        linters = {
          statix = {
            cmd = "${pkgs.statix}/bin/statix";
          };
        };
      };

      lsp.servers.nil-ls = {
        enable = true;
      };

      treesitter = {
        grammarPackages = [
          config.programs.nixvim.plugins.treesitter.package.builtGrammars.nix
        ];
      };
    };
  };
}
