return {
	"NeogitOrg/neogit",
  	dependencies = {
  		"nvim-lua/plenary.nvim",         -- required
  	  	"nvim-telescope/telescope.nvim", -- optional
  	  	"sindrets/diffview.nvim",        -- optional
  	  	"ibhagwan/fzf-lua",              -- optional
  	},
  	config = function()
		local neogit = require("neogit")
		neogit.setup {}
		vim.keymap.set("n", "<leader>ng", "<cmd>Neogit<cr>", { desc = "open neogit" })
	end,
}
