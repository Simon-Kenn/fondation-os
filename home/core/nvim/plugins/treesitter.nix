{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      settings = {
        nixGrammars = true;
        ensureInstalled = "all";
        nixvimInjections = true;

        indent.enable = true;
        highlight.enable = true;

        incrementalSelection = {
          enable = true;
          keymaps = {
            init_selection = "<leader>v";
            node_incremental = "<leader>vi";
            node_decremental = "<leader>vd";
          };
        };
      };
    };

    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ai" = "@conditional.outer";
          "ii" = "@conditional.inner";
          "al" = "@loop.outer";
          "il" = "@loop.inner";
          "ak" = "@block.outer";
          "ik" = "@block.inner";
          "is" = "@statement.inner";
          "as" = "@statement.outer";
          "ad" = "@comment.outer";
          "am" = "@call.outer";
          "im" = "@call.inner";
        };
      };
    };
  };
}
