{
  pkgs,
  inputs,
  ...
}: let
  neorg = pkgs.vimUtils.buildVimPlugin {
    version = "latest";
    pname = "neorg";
    src = inputs.neorg;
  };
  neorg-templates = pkgs.vimUtils.buildVimPlugin {
    version = "latest";
    pname = "neorg-templates";
    src = inputs.neorg-templates;
  };
in {
  programs.nixvim = {
    extraPlugins = [
      neorg-templates
    ];

    plugins = {
      headlines.enable = true;
      neorg = {
        enable = true;
        package = neorg;
        lazyLoading = true;
        modules = {
          "core.defaults".__empty = null;
          "core.concealer".__empty = null;
          "core.summary".__empty = null;
          "core.completion".config.engine = "nvim-cmp";
          "core.dirman".config = {
            workspaces = {
              notes = "~/Notes";
            };
            default_workspace = "notes";
          };
          "core.integrations.telescope".__empty = null;
          "external.templates".templates_dir = "~/Notes/templates";
        };
      };

      treesitter = {
        grammarPackages = with pkgs.tree-sitter-grammars; [
          tree-sitter-norg
          tree-sitter-norg-meta
        ];
      };
    };
  };
}
