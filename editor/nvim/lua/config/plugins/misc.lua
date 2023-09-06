return {
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap.set

			keymap("n", "]h", ":Gitsigns next_hunk<CR>", opts)
			keymap("n", "[h", ":Gitsigns prev_hunk<CR>", opts)
			keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", opts)
			keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", opts)
			keymap({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", opts)
			keymap("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", opts)
			keymap("n", "<leader>ghd", ":Gitsigns diffthis<CR>", opts)

			gitsigns.setup()
		end,
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
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {},
	},
	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({
				auto_cmd = true,
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- stylua: ignore
		keys = {
			{ "<leader>a",  function() require("harpoon.mark").add_file() end,        desc = "Harpoon add file", },
			{ "<leader>1",  function() require("harpoon.ui").nav_file(1) end,         desc = "Harpoon nav file 1", },
			{ "<leader>2",  function() require("harpoon.ui").nav_file(2) end,         desc = "Harpoon nav file 2", },
			{ "<leader>3",  function() require("harpoon.ui").nav_file(3) end,         desc = "Harpoon nav file 3", },
			{ "<leader>4",  function() require("harpoon.ui").nav_file(4) end,         desc = "Harpoon nav file 4", },
			{ "<leader>5",  function() require("harpoon.ui").nav_file(5) end,         desc = "Harpoon nav file 5", },
			{ "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon toggle quick menu" },
		},
	},
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
		-- stylua: ignore
		keys = {
			{ "-", function() require("oil").open() end, desc = "Open parent directory" },
		},
	},
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		-- stylua: ignore
	keys = {
			{ "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
		},
	},
}
