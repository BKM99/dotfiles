return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = false,
			columns = {
				-- "icon",
				-- "permissions",
				-- "size",
				-- "mtime",
			},
			view_options = {
				show_hidden = true,
			},
		},
		config = function(_, opts)
			require("oil").setup(opts)
			vim.keymap.set("n", "<leader>t", "<CMD>Oil<CR>", { desc = "Open parent directory (Oil)" })
		end,
	},
	{
		-- on macos might need to install gnu-sed
		"nvim-pack/nvim-spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "[S]earch and [R]eplace (Spectre)",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		config = function(_, opts)
			local gitsigns = require("gitsigns")
			gitsigns.setup(opts)
			vim.keymap.set("n", "<leader>bl", function()
				gitsigns.blame_line({ full = false })
			end, { desc = "Git blame line" })

			vim.keymap.set("n", "]h", gitsigns.next_hunk, { desc = "Next Hunk" })
			vim.keymap.set("n", "[h", gitsigns.prev_hunk, { desc = "Prev Hunk" })
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},
}
