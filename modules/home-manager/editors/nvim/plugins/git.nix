{
  programs.nixvim = {

    plugins = {
      gitsigns = {
        enable = true;
      };

      fugitive = {
        enable = true;
      };

      which-key = {
        settings = {
          spec = let 
            mode = [
              "n"
              "v"
              "i"
              "t"
              "c"
              "x"
              "s"
              "o"
            ];
          in [
            {
              __unkeyed-1 = "<leader>g";
              groupe = "git";
              desc = "Git";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gD";
              desc = "Vimdiff: prompt";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gR";
              __unkeyed-2 = "<cmd>Gitsigns stage_buffer<cr>";
              desc = "Reset buffer";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gS";
              __unkeyed-2 = "<cmd>Gitsigns reset_buffer_index<cr>";
              desc = "Stage buffer";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gU";
              __unkeyed-2 = "<cmd>Gitsigns reset_buffer<cr>";
              desc = "Unstage buffer";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gb";
              __unkeyed-2 = "<cmd>Gitsigns blame_line<cr>";
              desc = "Git-blame";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gd";
              __unkeyed-2 = "<cmd>Gitsigns diffthis<cr>";
              desc = "Vimdiff: default";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gp";
              __unkeyed-2 = "<cmd>Gitsigns preview_hunk<cr>";
              desc = "Preview hunk";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gr";
              __unkeyed-2 = "<cmd>Gitsigns reset_hunk<cr>";
              desc = "Reset hunk";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gs";
              __unkeyed-2 = "<cmd>Gitsigns stage_hunk<cr>";
              desc = "Stage hunk";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gt";
              __unkeyed-2 = "<cmd>Gitsigns setqflist<cr>";
              desc = "Trouble";
              inherit mode;
            }
            {
              __unkeyed-1 = "<leader>gu";
              __unkeyed-2 = "<cmd>Gitsigns undo_stage_hunk<cr>";
              desc = "Unstage hunk";
              inherit mode;
            }
            #{
            #  __unkeyed-1 = "{g";
            #  __unkeyed-2 = "<cmd>Gitsigns prev_hunk<cr>";
            #  desc = "Previous hunk";
            #  inherit mode;
            #}
            #{
            #  __unkeyed-1 = "}g";
            #  __unkeyed-2 = "<cmd>Gitsigns next_hunk<cr>";
            #  desc = "Next hunk";
            #  inherit mode;
            #}
          ];
        };
      };
    };

  };
}
