return {
	"williamboman/mason.nvim",

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "🟢",
					package_pending = "🕐",
					package_uninstalled = "🔴",
				}
			}
		})
		mason_lspconfig.setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"clangd",
				"gopls",
			},
			-- auto install configured servers, not related to ensure_installed
			automatic_installation = true,
		})
	end,
}
