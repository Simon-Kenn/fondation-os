{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      extensions = {
        fzf-native.enable = true;
        file-browser.enable = true;
        undo.enable = true;
        media-files = {
          enable = true;
        };
      };

      highlightTheme = "catppuccin";

      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>fz" = {
          action = "current_buffer_fuzzy_find";
          options.desc = "Find in current buffer";
        };
        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "Recent files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Grep";
        };
        "<leader>fw" = {
          action = "grep_string";
          options.desc = "Search word under cursor";
        };
        "<leader>fb" = {
          action = "buffers";
          options.desc = "Find buffer";
        };
        "<leader>fc" = {
          action = "command_history";
          options.desc = "Search in command history";
        };
      };
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>f";
        groupe = "telescope";
        desc = "Telescope";
      }
    ];


    keymaps = [
      {
        mode = "n";
        action = ":Telescope undo<cr>";
        key = "<leader>fu";
        options.desc = "Undo history";
      }
      {
        mode = "n";
        action = ":Telescope frecency<cr>";
        key = "<leader>fF";
        options.desc = "File frecencey";
      }
      {
        mode = "n";
        action = ":Telescope media_file<cr>";
        key = "<leader>fm";
        options.desc = "Seach media";
      }
      {
        mode = "n";
        action = ":Telescope file_browser<cr>";
        key = "<leader>fa";
        options.desc = "File browser";
      }
    ];
  };
}
