{
	programs.nixvim.plugins = {

		treesitter = {
			enable = true;
			nixGrammars = true;
			ensureInstalled = "all";
			nixvimInjections = true;

			indent = true;
			folding = true;

			incrementalSelection = {
				enable = true;
				keymaps = {
					initSelection = "<leader>v";
					nodeIncremental = "<leader>vi";
					nodeDecremental = "<leader>vd";
				};
			};
		};

		treesitter-textobjects = {
			enable = true;
			select = {
				enable = true;
				keymaps = {
					"aa" = "@parameter.outer";
					"ia" = "@parameter.inner";
					"af" = "@function.outer";
					"if" = "@function.inner";
					"ac" = "@class.outer";
					"ic" = "@class.inner";
					"ai" = "@conditional.outer";
					"ii" = "@conditional.inner";
					"al" = "@loop.outer";
					"il" = "@loop.inner";
					"ak" = "@block.outer";
					"ik" = "@block.inner";
					"is" = "@statement.inner";
					"as" = "@statement.outer";
					"ad" = "@comment.outer";
					"am" = "@call.outer";
					"im" = "@call.inner";
				};
			};
		};
	};
}
