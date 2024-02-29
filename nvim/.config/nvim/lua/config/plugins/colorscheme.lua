return {
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	name = "catppuccin",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("")
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
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("tokyonight-night")
	-- 	end,
	-- },
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
			vim.cmd([[highlight Comment guifg=#8f8c8c]])
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
	-- {
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	config = function()
	-- 		vim.cmd.colorscheme("gruvbox")
	-- 	end,
	-- },

	-- { "ramojus/mellifluous.nvim" },
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	config = function()
	-- 		vim.cmd([[ colo carbonfox ]])
	-- 	end,
	-- },
	-- { "blazkowolf/gruber-darker.nvim" },
}
