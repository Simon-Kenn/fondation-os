{
	programs.nixvim.plugins = {
		twilight = {
			enable = true;
			settings = {
				treesitter = true;
			};
		};
		
		zen-mode = {
			enable = true;
			settings = {
				twilight.enabled = true;
			};
		};
	};
}

