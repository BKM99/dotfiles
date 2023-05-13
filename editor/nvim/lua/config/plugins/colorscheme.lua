return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- },
	-- { "RRethy/nvim-base16", lazy = true },
	-- {
	-- 	"chriskempson/base16-vim",
	-- 	config = function()
	-- 		vim.cmd([[colo base16-gruvbox-dark-hard]])
	-- 		vim.cmd([[highlight Comment guifg=#8f8c8c]])
	-- 		-- vim.cmd([[hi Normal ctermbg=NONE]])
	-- 	end,
	-- },
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		if os.getenv("COLORTERM") == "truecolor" then
	-- 			vim.cmd([[
	-- 				colo kanagawa
	-- 				" hi Comment guifg=#7d83ab
	-- 				" hi LineNr guifg=#7d83ab
	-- 				hi VertSplit guifg=#FFA500
	-- 			]])
	-- 		else
	-- 			vim.cmd([[colo sorbet]])
	-- 		end
	-- 	end,
	-- },

	{
		"kvrohit/mellow.nvim",
		config = function()
			vim.cmd([[colo mellow]])
		end,
	},
}
