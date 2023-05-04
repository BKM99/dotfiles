return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = function()
			vim.cmd([[
				colo catppuccin
				hi Comment guifg=#7d83ab
				hi LineNr guifg=#7d83ab
			]])
		end,
	},
	{ "RRethy/nvim-base16", lazy = true },
}
