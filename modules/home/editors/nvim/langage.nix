{
	programs.nixvim.plugins = {
		lsp = {
			enable = true;

			servers = {
				nil_ls.enable = true;
				lua-ls.enable = true;
				ccls.enable = true;
				html.enable = true;
				tsserver.enable = true;
				eslint.enable = true;
				jsonls.enable = true;
				rust-analyzer = {
					enable = true;
					installRustc = true;
					installCargo = true;
				};
				texlab.enable = true;
				vuels.enable = true;
				bashls.enable = true;
				cssls.enable = true;
				ltex = {
					enable = true;
					settings.language = "fr";
				};
				taplo.enable = true;
				
			};
		};

		rust-tools.enable = true;
		ledger.enable = true;
		
		fidget.enable = true;
		lsp-format.enable = true;
		lspkind.enable = true;
		nvim-lightbulb.enable = true;
	};
}
