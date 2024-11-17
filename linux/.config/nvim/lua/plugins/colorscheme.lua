return {
	{
		"ribru17/bamboo.nvim",
		priority = 1000,
		config = function()
            require("bamboo").setup({
                transparent = true
            })
			vim.cmd([[colorscheme bamboo]])
		end
	},
	{
		"catppuccin/nvim",
	},
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"NTBBloodbath/doom-one.nvim",
	},
    {
        "nyoom-engineering/oxocarbon.nvim"
    },
    {
        "bluz71/vim-moonfly-colors"
    },
    {
        "navarasu/onedark.nvim",
		config = function()
            require("bamboo").setup({
                transparent = true
            })
		end
    },
    {
        "folke/tokyonight.nvim"
    },
    {
        "jacoborus/tender.vim"
    },
    {
        "nanotech/jellybeans.vim"
    },
    {
        "jaredgorski/SpaceCamp"
    },
    {
        "NTBBloodbath/doom-one.nvim"
    },
}
