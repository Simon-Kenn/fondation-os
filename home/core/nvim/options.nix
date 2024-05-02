{config, ...}: {
  programs.nixvim = {
    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };

    opts = {
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

      scrolloff = 999;

      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;

      swapfile = false;
      backup = false;
      undodir = "${config.home.homeDirectory}.vim/undodir";
      udofile = true;

      virtualedit = "block";
      inccommand = "split";

      ignorecase = true;

      termguicolors = true;
    };
  };
}
