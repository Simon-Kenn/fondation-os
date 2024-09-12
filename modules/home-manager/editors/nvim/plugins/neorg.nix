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
  neorg-interim-ls = pkgs.vimUtils.buildVimPlugin {
    version = "latest";
    pname = "neorg-interim-ls";
    src = inputs.neorg-interim-ls;
  };
  neorg-conceal-wrap = pkgs.vimUtils.buildVimPlugin {
    version = "latest";
    pname = "neorg-conceal-wrap";
    src = inputs.neorg-conceal-wrap;
  };  
  neorg-worklog =  pkgs.vimUtils.buildVimPlugin {
    version = "latest";
    pname = "neorg-worklog";
    src = inputs.neorg-worklog;
  };

  neorg-capture =  pkgs.vimUtils.buildVimPlugin {
    version = "latest";
    pname = "neorg-capture";
    src = inputs.neorg-capture;
  };  

  neorg-extras =  pkgs.vimUtils.buildVimPlugin {
    version = "latest";
    pname = "neorg-extras";
    src = inputs.neorg-extras;
  };

in {
  home.file.".config/nvim/templates/norg".source = ./templates/norg;
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      neorg
      neorg-telescope
      neorg-interim-ls
      neorg-conceal-wrap
      neorg-worklog
      neorg-templates
      neorg-capture
      neorg-extras
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
                cervauII = "~/CerveauII",
              },
              default_workspace = "cervauII",
            },
          },
          ["core.esupports.metagen"] =  {
            config = {
              type =  "auto",
            },
          },
          ["core.completion"] = {
            config = {
              engine = { module_name = "external.lsp-completion"},
            },
          },
          ["core.text-objects"] = {},

          ["core.integrations.telescope"] = {},

          ["external.interim-ls"] = {
            config = {
              completion_provider = {
                enable = true,
                categories = false
              }
            }
          },
          ["external.conceal-wrap"] = {},

          ["external.worklog"] = {
            config = {
              default_workspace_title = "test",
            }
          },
          ["external.templates"] = {
            keywords = {
              TODAY_OF_FILE_ORG = function() -- detect date from filename and return in org date format
                  local ls = require("luasnip")
                  local s = require("neorg.modules.external.templates.default_snippets")
                  return ls.text_node(s.parse_date(0, s.file_name_date(), [[<%Y-%m-%d %a]])) -- <2006-11-01 Wed>
                end,
                HOUR_OF_ORG = function() -- detect date from filename and return in norg date format
                  local ls = require("luasnip")
                  local s = require("neorg.modules.external.templates.default_snippets")
                  return ls.text_node(s.parse_date(0, os.time(), [[%H:%M:%S]])) -- 2006-11-01 Wed
                end,
            },
          },
          ["external.agenda"] = {},
          ["external.roam"] = {},
          ["external.many-mans"] = {
            config = {
              treesitter_fold = true
            },
          },
          ["external.capture"] = {
            templates = {
              description = "Exemple";
              name = "entrée",
              file = "~/CerveauII/Agenda",
              headline = "Boite de réception",
            },
          };
        },
      }
    '';

    plugins.which-key.settings.spec = let
        mode = ["n" "v" "o"];
    in [
      {
        __unkeyed-1 = "<leader><localleader>";
        groupe = "neorg";
        desc = "Neorg";
        inherit mode;
      }
      {
        __unkeyed-1 = "<leader><localleader>n";
        groupe = "neorg";
        desc = "Notes";
        inherit mode;
      }
      {
        __unkeyed-1 = "<leader><localleader>j";
        groupe = "neorg";
        desc = "Journal";
        inherit mode;
      }      
      {
        __unkeyed-1 = "<localleader>c";
        groupe = "neorg";
        desc = "Code";
        inherit mode;
      }      
      {
        __unkeyed-1 = "<localleader>i";
        groupe = "neorg";
        desc = "Insert";
        inherit mode;
      }
      {
        __unkeyed-1 = "<localleader>it";
        groupe = "neorg";
        desc = "Templates";
        inherit mode;
      }
      {
        __unkeyed-1 = "<localleader>l";
        groupe = "neorg";
        desc = "List";
        inherit mode;
      }
      {
        __unkeyed-1 = "<localleader>n";
        groupe = "neorg";
        desc = "Note";
        inherit mode;
      }
      {
        __unkeyed-1 = "<localleader>t";
        groupe = "neorg";
        desc = "Tasks";
        inherit mode;
      }
      {
        __unkeyed-1 = "<localleader>f";
        groupe = "neorg";
        desc = "Telescope";
        inherit mode;
      }
    ];

    keymaps = [
      { mode = ["n" "v" "o"]; key = "<leader><localleader>i"; action = "<cmd>Neorg index<cr>"; options.desc = "Index";}
      { mode = ["n" "v" "o"]; key = "<leader><localleader>nn"; action = "<cmd>Telescope neorg find_norg_files<cr>"; options.desc = "Search note";}
      { mode = ["n" "v" "o"]; key = "<leader><localleader>nl"; action = "<cmd>Telescope neorg find_linkable<cr>"; options.desc = "Search linkable";}

      { mode = ["n" "v" "o"]; key = "<leader><localleader>ja"; action = "<cmd>Neorg journal today<cr>"; options.desc = "Aujourd'hui";}
      { mode = ["n" "v" "o"]; key = "<leader><localleader>jd"; action = "<cmd>Neorg journal tomorrow<cr>"; options.desc = "Demain";}
      { mode = ["n" "v" "o"]; key = "<leader><localleader>jh"; action = "<cmd>Neorg journal yesterday<cr>"; options.desc = "Hier";}
      { mode = ["n" "v" "o"]; key = "<leader><localleader>jt"; action = "<cmd>Neorg journal toc<cr>"; options.desc = "Toc";}
      { mode = ["n" "v" "o"]; key = "<leader><localleader>jc"; action = "<cmd>Neorg journal custom<cr>"; options.desc = "Calendrier";}
    ];

    autoCmd = [
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set('n', '<localleader>in', '<cmd>Telescope neorg insert_file_link<cr>)',  {desc = "Note"}, { buffer = true }) 
          end''; 
        };
      }      
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set('n', '<localleader>il', '<cmd>Telescope neorg insert_link<cr>)',  {desc = "Lien"}, { buffer = true }) 
          end''; 
        };
      }      
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set('n', '<localleader>ite', '<cmd>Neorg templates entrée<cr>)',  {desc = "Entrée du journal"}, { buffer = true }) 
          end''; 
        };
      }      
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set('n', '<localleader>fb', '<cmd>Telescope neorg find_backlinks<cr>)',  {desc = "Backlinks"}, { buffer = true }) 
          end''; 
        };
      }      
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set('n', '<localleader>fh', '<cmd>Telescope neorg find_header_backlings<cr>)',  {desc = "Titre Backlinks"}, { buffer = true }) 
          end''; 
        };
      }      
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set('n', '<localleader>fn', '<cmd>Telescope neorg search_headings<cr>)',  {desc = "Titres"}, { buffer = true }) 
          end''; 
        };
      }
      # text object
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set('n', '<localleader>r', '<Plug>(neorg.text-objects.item-up)',  {desc = "Move item up"}, { buffer = true }) 
          end''; 
        };
      }      
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set('n', '<localleader>s', '<Plug>(neorg.text-objects.item-down)',  {desc = "Move item down"}, { buffer = true }) 
          end''; 
        };
      }
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set({ "o", "x" }, 'iH', '<Plug>(neorg.text-objects.textobject.heading.inner)',  {desc = "heading"}, { buffer = true }) 
          end''; 
        };
      }
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set({ "o", "x" }, 'aH', '<Plug>(neorg.text-objects.textobject.heading.outer)',  {desc = "heading"}, { buffer = true }) 
          end''; 
        };
      }
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set({ "o", "x" }, 'iT', '<Plug>(neorg.text-objects.textobject.tag.inner)',  {desc = "tag"}, { buffer = true }) 
          end''; 
        };
      }
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set({ "o", "x" }, 'aT', '<Plug>(neorg.text-objects.textobject.tag.outer)',  {desc = "tag"}, { buffer = true }) 
          end''; 
        };
      }
      {
        event = "Filetype";
        pattern = "norg";
        callback = { __raw = '' 
          function() 
            vim.keymap.set({ "o", "x" }, 'aL', '<Plug>(neorg.text-objects.textobject.list.outer)',  {desc = "list"}, { buffer = true }) 
          end''; 
        };
      }
    ];
  };
}
