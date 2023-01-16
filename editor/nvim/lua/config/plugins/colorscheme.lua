return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd([[ colo catppuccin ]])
			vim.cmd([[ hi Comment guifg=#7d83ab]])
		end,
	},
}
