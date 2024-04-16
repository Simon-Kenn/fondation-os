{
	programs.nixvim = {
		plugins.telescope = {
			enable = true;

			extensions = { 
				fzf-native.enable = true;
				#media-files.enable = true;
			};

			highlightTheme = "catppuccin";

			keymaps = {
				"<leader>ff" = {
					action = "find_files";
					desc = "Find files";
				};
				"<leader>fz" = {
					action = "current_buffer_fuzzy_find";
					desc = "Find in current buffer";
				};
				"<leader>fr" = {
					action = "oldfiles";
					desc = "Recent files";
				};
				"<leader>fg" = {
					action = "live_grep";
					desc = "Grep";
				};
				"<leader>fw" = {
					action = "grep_string";
					desc = "Search word under cursor";
				};
				"<leader>fb" = {
					action = "buffers";
					desc = "Find buffer";
				};
				"<leader>fc" = {
					action = "command_history";
					desc = "Search in command history";
				};
			};
		};
	};
}
