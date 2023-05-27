return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		config = function()
			require("nvim-tree").setup({})
		end,
		keys = {
			{ "<leader>t", ":NvimTreeToggle<cr>", desc = "toggle nvim tree" },
		},
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				use_diagnostic_signs = true,
				icons = false,
			})
		end,
		keys = {
			{ "<leader>m", ":TroubleToggle<cr>", desc = "Toggle Trouble" },
		},
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>S",
				function()
					require("spectre").open()
				end,
				desc = "Open Spectre",
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				desc = "Open current word in spectre",
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if cmp_status_ok then
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},
	{
		"airblade/vim-rooter",
		config = function()
			vim.cmd([[ let g:rooter_silent_chdir = 1 ]])
		end,
	},
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
	{
		"mbbill/undotree",
		keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "UndoTreeToggle" } },
		config = function()
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
}
