{
	programs.nixvim.options = {
		enc = "utf-8";
		fileencoding = "utf-8";
		conceallevel = 3;

		number = true;	
		relativenumber = true;

		splitbelow = true;
		splitright = true;

		wrap = false;

		smarttab = true;
		autoindent = true;
		smartindent = true;
		tabstop = 2;
		shiftwidth = 2;
		softtabstop = 2;

		clipboard = "unnamedplus";

		scrolloff = 999;

		virtualedit = "block";
		inccommand = "split";

		ignorecase = true;

		termguicolors = true;

	};
}
