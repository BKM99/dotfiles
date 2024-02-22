return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	config = function()
	-- 		vim.cmd([[ colo catppuccin-mocha ]])
	-- 	end,
	-- },
	-- {
	-- 	"RRethy/nvim-base16",
	-- 	config = function()
	-- 		vim.cmd([[colo base16-gruvbox-dark-hard]])
	-- 		vim.cmd([[highlight Comment guifg=#8f8c8c]])
	-- 	end,
	-- },
	-- {
	-- 	"chriskempson/base16-vim",
	-- 	config = function()
	-- 		vim.cmd([[colo base16-gruvbox-dark-hard]])
	-- 		vim.cmd([[highlight Comment guifg=#8f8c8c]])
	-- 		vim.cmd([[hi Normal ctermbg=NONE]])
	-- 	end,
	-- },
	-- { -- You can easily change to a different colorscheme.
	-- 	-- Change the name of the colorscheme plugin below, and then
	-- 	-- change the command in the config to whatever the name of that colorscheme is
	-- 	--
	-- 	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
	-- {
	-- 	"kvrohit/mellow.nvim",
	-- 	config = function()
	-- 		vim.cmd([[colo mellow]])
	-- 	end,
	-- },
	--  {
	--      "Mofiqul/vscode.nvim",
	--      config = function()
	--          vim.cmd([[
	-- colo vscode
	-- hi Normal guibg=#161617
	-- hi SignColumn guibg=#161617
	-- hi LineNr guibg=#161617
	-- ]])
	--      end,
	--  },
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
	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	config = function()
	-- 		vim.cmd([[
	-- 		colorscheme dracula-soft
	-- 	]])
	-- 	end,
	-- },
	-- { "ellisonleao/gruvbox.nvim", config = function ()
	-- 	vim.cmd([[ colo gruvbox ]])
	-- end },

	-- {"ramojus/mellifluous.nvim"},
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	config = function()
	-- 		vim.cmd([[ colo carbonfox ]])
	-- 	end,
	-- },
	-- { "blazkowolf/gruber-darker.nvim" },
}
