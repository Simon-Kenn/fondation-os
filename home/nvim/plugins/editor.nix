{
	programs.nixvim = {
		plugins = {
			which-key = {
				enable = true;
				registrations = {
					"<leader>f" = "Telescope";
				};
			};
		};
		keymaps = [

			{
				mode = "n";
				action = ":WhichKey<cr>";
				key = "W";
				options.desc = "Show whichKey";
			}
		];
	};
}
