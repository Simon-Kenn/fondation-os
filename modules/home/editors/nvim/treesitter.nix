{ config, ...}: {
  programs.nixvim.plugins = {

    treesitter = {
      enable = true;
      nixvimInjections = true;
      ensureInstalled = "all"; # TODO: change this
      indent = true;
      folding = true;

      incrementalSelection = {
        enable = true;

        keymaps = {
          initSelection = "<Leader>à";
          nodeIncremental = "<Leader>ài";
          nodeDecremental = "<Leader>àd";
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

    rainbow-delimiters.enable = true;
    ts-autotag.enable = true;
    ts-context-commentstring.enable = true;
  };
}
