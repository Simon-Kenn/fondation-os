local options = {
	mouse = "a",

	enc = "utf-8",
	fileenconding = "utf-8",
	conceallevel = 3,

	register = "unnamedplus",

	number = true,
	relativenumber = true,
	numberwidth = 4,

	tabstop = 2,
	softtabstop = 2,
	shiftwidth = 2,
	expandtab = true,

	splitright = true;

	wrap = false;

	scrolloff = 999;

	foldcolumn = "1",
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,

	swapfile = false,
	backup = false,
	undodir = os.getenv('XDG_CACHE_HOME') .. '/nvim/undodir',
	undofile = true,

	virtualedit = "block",
	inccommand = "split",

	ignorecase = true,

	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
