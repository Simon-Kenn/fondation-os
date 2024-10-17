local keymap = vim.keymap.set
local mode = { "n", "v", "o"}
local mode_to = {"o", "x"}

-- word movements
return {
	keymap(mode, "é", "w", { desc = "word forward"}),
	keymap(mode, "É", "W", { desc = "WORD forward"}),

	keymap(mode, "t", "h", { desc = "right" }),
	keymap(mode, "s", "j", { desc = "down" }),
	keymap(mode, "r", "k", { desc = "up" }),
	keymap(mode, "n", "l", { desc = "left" }),

	keymap(mode, "T", "H", { desc = "screen up"}),
	keymap(mode, "N", "L", { desc = "screen down"}),

	keymap(mode, "S", "J", { desc = "join"}),
	keymap(mode, "R", "K", { desc = "help"}),

	keymap(mode, "k", "t", { desc = "search char -1 right"}),
	keymap(mode, "K", "T", { desc = "search char -1 left "}),

	keymap(mode, "j", "s", { desc = "del x char"}),
	keymap(mode, "J", "S", { desc = "del x line"}),

	keymap(mode, "h", "r", { desc = "Replace char"}),
	keymap(mode, "H", "R", { desc = "Replace line"}),

	keymap(mode, "l", "n", { desc = "rep search ->"}),
	keymap(mode, "L", "N", { desc = "rep search <-"}),

	keymap(mode, "gr", "n", { desc = "line screen up"}),
	keymap(mode, "gs", "N", { desc = "line screen down"}),

	keymap(mode, "è", "^", { desc = "beg line"}),
	keymap(mode, "È", "0", { desc = "beg line"}),
	-- TODO map buffer command in other place !
	keymap(mode, "gb", "gT", { desc = "tab prev"}),
	keymap(mode, "gé", "gt", { desc = "tap next"}),

	keymap(mode, "ê", "{", { desc = "Prev empty line"}),
	keymap(mode, "Ê", "}", { desc = "Next empty line"}),

	keymap(mode, "Ê", "(", { desc = "Prev sentence"}),
	keymap(mode, "À", ")", { desc = "Next sentence"}),

	keymap(mode, "\"" ,"1"),
	keymap(mode, "1"	,"\""),
	keymap(mode, "«"	,"2"),
	keymap(mode, "2"	,"«"),
	keymap(mode, "3"	,"»"),
	keymap(mode, "»"	,"3"),
	keymap(mode, "("	,"4"),
	keymap(mode, "4"	,"("),
	keymap(mode, ")"	,"5"),
	keymap(mode, "5"	,")"),
	keymap(mode, "@"	,"6"),
	keymap(mode, "6"	,"@"),
	keymap(mode, "+"	,"7"),
	keymap(mode, "7"	,"+"),
	keymap(mode, "-"	,"8"),
	keymap(mode, "8"	,"-"),
	keymap(mode, "/"	,"9"),
	keymap(mode, "9"	,"/"),
	keymap(mode, "*"	,"0"),
	keymap(mode, "0"	,"*"),

	keymap(mode_to, "aé", "aw", { desc = "outer word"}),
	keymap(mode_to, "aÉ", "aW", { desc = "outer WORD"}),
	keymap(mode_to, "ié", "iw", { desc = "inner word"}),
	keymap(mode_to, "iÉ", "iW", { desc = "inner WORD"}),
}
