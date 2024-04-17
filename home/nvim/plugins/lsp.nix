{
	programs.nixvim = {
		plugins = {
			lsp = {
				enable = true;

				keymaps = {
					diagnostic = {
						"}d" = "goto_next";
						"{d" = "goto_prev";
					};
					lspBuf = {
						R = "hover";
						gD = "declaration";
						gd = "definition";
						gi = "implementation";
						gt = "type_definition";
						"<leadere>cr" = {
							action = "rename";
							desc = "Rename";
						};
					};
				};
			};

			conform-nvim = {
				enable = true;
				formatOnSave = {
					lspFallback = true;
					timeoutMs = 500;
				};
			};

			lint = {
				enable = true;
			};

			which-key.registrations = {
				"<leader>a" = "Code";
				"g" = "goto";
				"}" = "next";
				"{" = "prev";
			};
		};
	};
}
