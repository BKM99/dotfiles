return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap.set

			keymap("n", "]h", ":Gitsigns next_hunk<CR>", opts)
			keymap("n", "[h", ":Gitsigns prev_hunk<CR>", opts)
			-- keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", opts)
			keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", opts)
			keymap({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", opts)
			keymap("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", opts)
			keymap("n", "<leader>ghd", ":Gitsigns diffthis<CR>", opts)

			gitsigns.setup()
		end,
	},
	{
		"TimUntersberger/neogit",
		dependencies = { "sindrets/diffview.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local neogit = require("neogit")

			neogit.setup({
				integrations = {
					diffview = true,
				},
			})
		end,
		keys = { { "<leader>ng", ":Neogit<cr>" } },
	},

	{ "f-person/git-blame.nvim", keys = { { "<leader>bl", ":GitBlameToggle<cr>" } } },
}
