return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = function ()
			vim.cmd[[ colo catppuccin-mocha ]]
		end
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

	-- {
	-- 	"kvrohit/mellow.nvim",
	-- 	config = function()
	-- 		vim.cmd([[colo mellow]])
	-- 	end,
	-- },
	-- {
	-- 	"Mofiqul/vscode.nvim",
	-- 	config = function()
	-- 		vim.cmd([[
	-- 		colo vscode
	-- 		hi Normal guibg=#161617
	-- 		hi SignColumn guibg=#161617
	-- 		hi LineNr guibg=#161617
	-- 		]])
	-- 	end,
	-- },
	-- { "maxmx03/solarized.nvim" },
	-- {
	-- 	-- "rose-pine/neovim",
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			-- transparent = true,
	-- 			-- styles = {
	-- 			-- 	sidebars = "transparent",
	-- 			-- 	floats = "transparent",
	-- 			-- },
	-- 		})
	-- 		vim.cmd([[colo tokyonight-night]])
	--
	-- 		-- ColorMyPencils()
	-- 	end,
	-- },
	-- { "folke/tokyonight.nvim", config = function ()
	-- 	vim.cmd([[ colorscheme tokyonight-night ]])
	-- end },
	-- { "Mofiqul/dracula.nvim", config = function ()
	-- 	vim.cmd([[
	-- 		colorscheme dracula-soft
	-- 	]])
	--
	-- end },
}
