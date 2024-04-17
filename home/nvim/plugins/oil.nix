{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>o";
        action = "<cmd>Oil<cr>";
        options.desc = "Open Oil parent directory";
      }
    ];

    plugins.oil = {
      enable = true;

      settings = {
        default_file_explorer = true;
        buf_options = {
          buflisted = false;
          bufhidden = "hide";
        };

        win_options = {
          wrap = false;
          signcolumn = "no";
          cursorcolumn = false;
          foldcolumn = "0";
          spell = false;
          list = false;
          conceallevel = 3;
          concealcursor = "nvic";
        };
        delete_to_trash = false;
        skip_confirm_for_simple_edits = false;
        prompt_save_on_select_new_entry = true;
        cleanup_delay_ms = 2000;
        lsp_file_method = {
          timeout_ms = 1000;
          autosave_changes = true;
        };
        constrain_cursor = "editable";
        experimental_watch_for_changes = false;
        keymaps = {
          "g?" = "actions.show_help";
          "<CR>" = "actions.select";
          "<A-v>" = "actions.select_vsplit";
          "<A-h>" = "actions.select_split";
          "<A-t>" = "actions.select_tab";
          "<A-p>" = "actions.preview";
          "<A-c>" = "actions.close";
          "<A-l>" = "actions.refresh";
          "-" = "actions.parent";
          "_" = "actions.open_cwd";
          "`" = "actions.cd";
          "~" = "actions.tcd";
          "g." = "actions.toggle_hidden";
        };
        keymaps_help = {
          border = "rounded";
        };
        use_default_keymaps = true;
        view_options = {
          show_hidden = false;
          is_hidden_file = ''
            function(name, bufnr)
              return vim.startswith(name, ".")
            end
          '';
          is_always_hidden = ''
            function(name, bufnr)
              return false
            end
          '';
          natural_order = true;
          sort = [
            ["type" "asc"]
            ["name" "asc"]
          ];
        };
        float = {
          padding = 2;
          max_width = 0;
          max_height = 0;
          border = "rounded";
          win_options = {
            winblend = 0;
          };
          override = ''
            function(conf)
              return conf
            end
          '';
        };
        preview = {
          max_width = 0.9;
          min_width = [40 0.4];
          width = null;
          max_height = 0.9;
          min_height = [5 0.1];
          height = null;
          border = "rounded";
          win_options = {
            winblend = 0;
          };
          update_on_cursor_moved = true;
        };
        progress = {
          max_width = 0.9;
          min_width = [40 0.4];
          width = null;
          max_height = 0.9;
          min_height = [5 0.1];
          height = null;
          border = "rounded";
          minimized_border = "none";
          win_options = {
            winblend = 0;
          };
        };
        ssh = {
          border = "rounded";
        };
      };
    };
  };
}
