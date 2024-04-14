{
  programs.nixvim = {
		globals = {
			mapleader = " ";
    	maplocalleader = ",";
		};

		options = {
  	  enc = "utf-8";
			fileencoding = "utf-8";

			conceallevel = 3;

			syntax = "on";
  	 	ruler = true;
  	 	visualbell = true;
  	 	hidden = true;

  	 	number = true;
  	 	relativenumber = true;

			splitbellow = true;
			splitright = true;

			wrap = true;
			clipboard = "unamedplus";

  	 	foldmethod = "expr";
			foldexpr = "nvim_treesitter#foldexpr()";
  	 	foldenable = false;
  	 	foldlevel = 99;

  	 	tabstop = 2;
  	 	shiftwidth = 2;
  	 	softtabstop = 2;
			expandtab = true;
  	 	smarttab = true;
  	 	autoindent = true;
  	 	smartindent = true;

			swapfile = false;
			backup = false;
# TODO: should not be hardcoded
			undodir = "/home/leto/.vim/undodir";
			undofile = true;

			hlsearch = false;
			incsearch = true;

			scrolloff = 999;
			colorcolumn = "120";
  	};
	};
}
