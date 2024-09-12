local library = {}

local path = vim.split(package.path, ";")

-- this is the ONLY correct way to setup your path
table.insert(path, "lua/?.lua")
table.insert(path, "lua/?/init.lua")

local function add(lib)
  for _, p in pairs(vim.fn.expand(lib, false, true)) do
    p = vim.loop.fs_realpath(p)
    library[p] = true
  end
end

-- add runtime
add("$VIMRUNTIME")

-- add your config
add("~/.config/nvim")
return {
	--settings = {
	--	Lua = {
	--		version = "LuaJIT",
	--		path = path
	--	},
	--	diagnostics = {
	--		globals = { "vim" }
	--	},
	--	workspace = {
	--		library = library,
	--		maxPreload = 2000,
	--		preloadFileSize = 50000
	--	},
	--	telemetry = { enable = false }
	--}
	--
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = library
			},
		},
	},
}
