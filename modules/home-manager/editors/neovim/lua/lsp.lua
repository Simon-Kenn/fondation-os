local cmp = require('cmp')
local has_word_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function lsp_setup()
	local lsp = require('lsp')
	local fidget = require('fidget')
	local luasnip = require('luasnip')
	local config = require('lspconfig')

	fidget.setup()

	cmp.setup {

		snippet = {
			expand = {
				function(args)
					require('luasnip').lsp_expand(args.body)
				end
			},
		},

		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'path' },
			{ name = 'neorg' },
			{ name = 'lua_ls' },
			{ name = 'nill_ls' },
			{ name = 'nvim_lua' }
		},

		mapping = {
			["<CR>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					if luasnip.expandable() then
						luasnip.expand()
					else
						cmp.confirm({ select = true })
					end
						fallback()
				end
			end, {"i", "s"}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_word_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s"}),

			["<s-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {"i", "s"}),
		},
	}

	config.lua_ls.setup(lsp.nvim_lua_ls())

	lsp.setup_servers({
		'lua_ls',
		'nill_ls',
		'rust_analyzer',
		--'tsserver',
	})
end

return xpcall(lsp_setup, function() print("Setup of LSP failed!") end)
