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
    keymaps = [
      {
        mode = "n";
        action = "<cmd>Neorg index<CR>";
        key = "<leader>mi";
        options.desc = "Index";
      }
      {
        mode = "n";
        action = "<cmd>Neorg journal today<CR>";
        key = "<leader>mja";
        options.desc = "Aujourd'hui";
      }
      {
        mode = "n";
        action = "<cmd>Neorg journal yesterday<CR>";
        key = "<leader>mjh";
        options.desc = "Hier";
      }
      {
        mode = "n";
        action = "<cmd>Neorg journal tomorrow<CR>";
        key = "<leader>mjd";
        options.desc = "Demain";
      }
      {
        mode = "n";
        action = "<cmd>Neorg journal toc reload<CR>";
        key = "<leader>mju";
        options.desc = "Mettre à jours l'index";
      }
      {
        mode = "n";
        action = "<cmd>Neorg journal toc open<CR>";
        key = "<leader>mjt";
        options.desc = "Index";
      }
      {
        mode = "n";
        action = "<cmd>Neorg journal tomorrow<CR>";
        key = "<leader>mjd";
        options.desc = "Demain";
      }
      {
        mode = "n";
        action = "<cmd>Neorg toc<CR>";
        key = "<localleader>à";
        options.desc = "TOC";
      }

      {
        mode = "n";
        action = "<cmd>Neorg journal toc<CR>";
        key = "<leader>mjt";
        options.desc = "Index";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind all core.integrations.telescope.find_norg_files<CR>";
        key = "<leader>fn";
        options.desc = "Notes";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind all core.integrations.telescope.find_norg_files<CR>";
        key = "<leader>fn";
        options.desc = "Notes";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind all core.integrations.telescope.find_linkable<CR>";
        key = "<leader>fl";
        options.desc = "Liens";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind norg core.integrations.treesitter.next.heading<cr>";
        key = "<localleader>s";
        options.desc = "Titre suivant";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind norg core.integrations.treesitter.previous.heading<cr>";
        key = "<localleader>r";
        options.desc = "Titre précedant";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind norg core.integrations.treesitter.next.link<cr>";
        key = "<localleader>S";
        options.desc = "Liens suivant";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind norg core.integrations.treesitter.previous.link<cr>";
        key = "<localleader>R";
        options.desc = "Liens précédent";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind norg core.integrations.telescope.insert_file_link<cr>";
        key = "<localleader>in";
        options.desc = "Insérer une note";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind norg core.integrations.telescope.insert_link<cr>";
        key = "<localleader>il";
        options.desc = "Insérer un lien";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind norg core.integrations.telescope.search_headings<cr>";
        key = "<localleader>ft";
        options.desc = "Cherchez dans les titres de la page";
      }
      {
        mode = "n";
        action = "<cmd>Neorg keybind norg core.itero.next-iteration<cr>";
        key = "<localleader><cr>";
        options.desc = "Nouvelle itération";
      }

      {
        mode = "n";
        action = "<cmd>Neorg keybind norg core.itero.next-iteration<cr>";
        key = "<localleader><cr>";
        options.desc = "Nouvelle itération";
      }
      {
        mode = "n";
        action = "<cmd>Neorg templates add<cr>";
        key = "<localleader>aa";
        options.desc = "add";
      }
      {
        mode = "n";
        action = "<cmd>Neorg templates load<cr>";
        key = "<localleader>al";
        options.desc = "Load";
      }
      {
        mode = "n";
        action = "<cmd>Neorg templates fload<cr>";
        key = "<localleader>af";
        options.desc = "Fload";
      }
      {
        mode = "n";
        action = "<cmd>Neorg templates journal<cr>";
        key = "<localleader>aj";
        options.desc = "Journal";
      }
    ];
    extraPlugins = [
      neorg-templates
    ];

    plugins = {
      headlines.enable = true;
      which-key.registrations = {
        "<leader>m" = "Neorg";
        "<leader>mj" = "Journal";
        "<localleader>f" = "Cherchez dans la page";
        "<localleader>i" = "Inserer";
        "<localleader>a" = "Template";
        "<localleader>t" = "Tâches";
      };
      neorg = {
        enable = true;
        package = neorg;
        lazyLoading = true;
        modules = {
          "core.defaults".__empty = null;
          "core.esupports.metagen" = {
            config = {
              type = "none";
            };
          };
          "core.dirman".config = {
            workspaces = {
              notes = "~/Notes";
            };
            default_workspace = "notes";
          };
          "core.journal" = {
            config = {
              journal_folder = "Journal";
              strategy = "nested";
              workspaces = "notes";
            };
          };

          "core.concealer".__empty = null;
          "core.summary".__empty = null;
          "core.ui.calendar".__empty = null;
          "core.completion".config.engine = "nvim-cmp";
          "core.manoeuvre".__empty = null;
          "core.presenter" = {
            config = {
              zen_mode = "zen-mode";
            };
          };
          "core.integrations.telescope".__empty = null;
          "external.templates" = {
            config = {
              templates_dir = "~/Notes/templates";
              keywords = {
                TODAY_STRING = {
                  __raw =
                    /*
                    lua
                    */
                    ''
                      function() -- detect date from filename and return in org date format
                                                        local ls = require("luasnip")
                                                        local s = require("neorg.modules.external.templates.default_snippets")
                                                        return ls.text_node(s.parse_date(0, s.file_name_date(), [[%A %d %B %Y]])) -- 2006-11-01 Wed
                                                      end,

                    '';
                };
                #HOUR_OF_ORG = {
                #  __raw =
                #    /*
                #    lua
                #    */
                #    ''                      function() -- detect date from filename and return in org date format
                #                                      local ls = require("luasnip")
                #                                      local s = require("neorg.modules.external.templates.default_snippets")
                #                                      return ls.text_node(s.parse_date(0, s.file_name_date(), [[%A %d %B %Y]])) -- 2006-11-01 Wed
                #                                    end,

                #    '';
                #};
              };
            };
          };
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
