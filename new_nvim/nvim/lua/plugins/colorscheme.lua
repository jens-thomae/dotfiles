return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			styles = {
        bold = true,
        italic = true,
        transparency = true,
    },

		})
		color = color or "rose-pine"
		vim.cmd.colorscheme(color)
		-- If theme does not support transparency nativerly
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
}
