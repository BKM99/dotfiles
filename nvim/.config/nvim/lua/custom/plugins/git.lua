return {
	{
		"sindrets/diffview.nvim",
		opts = {
			enhanced_diff_hl = true,
			use_icons = false,
		},
		keys = {
			{ "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "[D]iffview [O]pen" },
			{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "[D]iffview [C]lose" },
			{ "<leader>dr", "<cmd>DiffviewRefresh<cr>", desc = "[D]iffview [R]efresh" },
			{ "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "[D]iffview [F]ileHistory" },
		},
	},
	{

		"lewis6991/gitsigns.nvim",
		opts = {},
		config = function(_, opts)
			local gitsigns = require("gitsigns")
			gitsigns.setup(opts)
			local keymap = vim.keymap.set
			keymap("n", "<leader>bl", function()
				gitsigns.blame_line({ full = true })
			end, { desc = "Git blame line" })
			keymap("n", "]h", gitsigns.next_hunk, { desc = "Next Hunk" })
			keymap("n", "[h", gitsigns.prev_hunk, { desc = "Prev Hunk" })
			keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", { desc = "Git Blame line" })
			keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Git Stage hunk" })
			keymap({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Git reset hunk" })
			keymap("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", { desc = "Git Undo stage hunk" })
			keymap("n", "<leader>ghd", ":Gitsigns diffthis<CR>", { desc = "Git diffthis" })
		end,
	},
}
