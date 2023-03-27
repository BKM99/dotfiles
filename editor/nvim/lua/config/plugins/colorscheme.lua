return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = function()
			vim.cmd([[ colo catppuccin ]])
			vim.cmd([[ hi Comment guifg=#7d83ab]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		config = function()
			-- vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
}
