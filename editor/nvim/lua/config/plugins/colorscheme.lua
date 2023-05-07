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
	-- { "RRethy/nvim-base16", lazy = true },
	-- {
	-- 	"chriskempson/base16-vim",
	-- 	config = function()
	-- 		vim.cmd([[colo base16-gruvbox-dark-hard]])
	-- 		vim.cmd([[highlight Comment guifg=#8f8c8c]])
	-- 		-- vim.cmd([[hi Normal ctermbg=NONE]])
	-- 	end,
	-- },
	-- { "rebelot/kanagawa.nvim" },
}
