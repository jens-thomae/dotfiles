return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"onsails/lspkind.nvim",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip");
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			formatting = ({
				format = lspkind.cmp_format({
    					mode = "symbol_text",
    					menu = ({
    					  	buffer = "[Buffer]",
    					  	nvim_lsp = "[LSP]",
    					  	luasnip = "[LuaSnip]",
    					  	nvim_lua = "[Lua]",
    					  	latex_symbols = "[Latex]",
    					})
  				}),
			}),

			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			mapping = ({
      				["<C-p>"] = cmp.mapping.select_prev_item(),
      				["<C-n>"] = cmp.mapping.select_next_item(),
      				["<C-d>"] = cmp.mapping.scroll_docs(-4),
      				["<C-f>"] = cmp.mapping.scroll_docs(4),
      				["<C-Space>"] = cmp.mapping.complete(),
      				-- ["<Esc>"] = cmp.mapping.close(),
      				["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      				["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
   			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
