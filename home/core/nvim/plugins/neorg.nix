{
  pkgs,
  inputs,
  ...
}: let
  neorg-templates = pkgs.vimUtils.buildVimPlugin {
    version = "latest";
    pname = "neorg-templates";
    src = inputs.neorg-templates;
  };
in {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      #neorg-templates
      neorg
      neorg-telescope
    ];
    extraConfigLua = /*lua*/ ''
      -- vim.wo.foldlevel = 99
      -- vim.wo.conceallevel = 3

      require("nvim-treesitter.configs").setup {
        higlight = {
          enable = true,
        }
      }

      require("neorg").setup{
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },

          ["core.integrations.telescope"] = {},
        },
      }
    '';

    #plugins = {
    #  headlines.enable = true;
    #};

    #plugins = {
    #  headlines.enable = true;
    #  neorg = {
    #    enable = true;
    #    #package = pkgs.neorg;
    #    lazyLoading = true;
    #    modules = {
    #      "core.defaults".__empty = null;
    #      "core.esupports.metagen" = {
    #        config = {
    #          type = "none";
    #        };
    #      };
    #      "core.dirman".config = {
    #        workspaces = {
    #          notes = "~/Notes";
    #        };
    #        default_workspace = "notes";
    #      };
    #      "core.journal" = {
    #        config = {
    #          journal_folder = "Journal";
    #          strategy = "nested";
    #          workspaces = "notes";
    #        };
    #      };

    #      "core.concealer".__empty = null;
    #      "core.summary".__empty = null;
    #      "core.ui.calendar".__empty = null;
    #      "core.completion".config.engine = "nvim-cmp";
    #      "core.manoeuvre".__empty = null;
    #      "core.presenter" = {
    #        config = {
    #          zen_mode = "zen-mode";
    #        };
    #      };
    #      "core.integrations.telescope".__empty = null;
    #      "external.templates" = {
    #        config = {
    #          templates_dir = "~/Notes/templates";
    #          keywords = {
    #            __raw =
    #              /*
    #              lua
    #              */
    #              ''
    #                {
    #                  TODAY_OF_FILE_ORG = function() -- detect date from filename and return in org date format
    #                     local ls = require("luasnip")
    #                     local s = require("neorg.modules.external.templates.default_snippets")
    #                     return ls.text_node(s.parse_date(0, s.file_name_date(), [[<%Y-%m-%d %a]])) -- <2006-11-01 Wed>
    #                   end,
    #                   HOUR_OF_ORG = function() -- detect date from filename and return in norg date format
    #                     local ls = require("luasnip")
    #                     local s = require("neorg.modules.external.templates.default_snippets")
    #                     return ls.text_node(s.parse_date(0, os.time(), [[%H:%M:%S]])) -- 2006-11-01 Wed
    #                   end,
    #                 }
    #              '';
    #            #};
    #          };
    #        };
    #      };
    #    };
    #  };

    #  treesitter = {
    #    grammarPackages = with pkgs.tree-sitter-grammars; [
    #      tree-sitter-norg
    #      tree-sitter-norg-meta
    #    ];
    #  };
    #};
  };
}
