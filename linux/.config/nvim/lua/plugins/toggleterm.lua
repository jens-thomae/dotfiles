return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local toggleterm = require("toggleterm")
		toggleterm.setup({
			shade_terminals = true,
			size = 80,
		})

		-- Sets default keymaps for for navigating the terminal buffer
		function _G.set_terminal_keymaps()
  			local opts = {buffer = 0}
  			-- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  			-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  			vim.keymap.set('t', '<M-h>', [[<Cmd>wincmd h<CR>]], opts)
  			vim.keymap.set('t', '<M-j>', [[<Cmd>wincmd j<CR>]], opts)
  			vim.keymap.set('t', '<M-k>', [[<Cmd>wincmd k<CR>]], opts)
  			vim.keymap.set('t', '<M-l>', [[<Cmd>wincmd l<CR>]], opts)
  			vim.keymap.set('t', '<M-w>', [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

		-- Custom lazygit terminal
		local Terminal  = require('toggleterm.terminal').Terminal
		local lazygit = Terminal:new({
  			cmd = "lazygit",
  			dir = "git_dir",
  			direction = "float",
  			float_opts = {
  			  	border = "double",
  			},
  			-- function to run on opening the terminal
  			on_open = function(term)
  			  	vim.cmd("startinsert!")
  			  	vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  			end,
  			-- function to run on closing the terminal
  			on_close = function(term)
  			  	vim.cmd("startinsert!")
  			end,
		})
		function _lazygit_toggle()
  			lazygit:toggle()
		end

		local float = Terminal:new({
  			direction = "float",
  			float_opts = {
  			  	border = "double",
  			},
  			-- function to run on opening the terminal
  			on_open = function(term)
  			  	vim.cmd("startinsert!")
  			  	vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<M-i>", [[<C-\><C-n> <bar> <Cmd>close<CR>]], {noremap = true, silent = true})
  			end,
  			-- function to run on closing the terminal
  			on_close = function(term)
  			  	vim.cmd("startinsert!")
  			end,
		})
		function _float_toggle()
  			float:toggle()
		end
		vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
		vim.api.nvim_set_keymap("n", "<M-i>", "<Cmd>lua _float_toggle()<CR>", {noremap = true, silent = true})
	end,
}
