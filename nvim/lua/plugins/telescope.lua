return {
	"nvim-telescope/telescope.nvim",
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		-- local actions = require("telescope.actions")

		telescope.setup()
		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find recent files" })
		vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find string in cwd" })
		vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Fuzzy find string uder cursor in cwd" })
		vim.keymap.set("n", "<leader>fn", "<cmd>Telescope colorscheme<cr>", { desc = "Fuzzy find all recent notifications" })
		vim.keymap.set("n", "<leader>th", "<cmd>Telescope colorscheme<cr>", { desc = "Select a colorscheme" })
	end,
}
