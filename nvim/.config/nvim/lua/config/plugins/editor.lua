return {
	{
		"folke/snacks.nvim",
		opts = {
			picker = {},
			explorer = {},
		},
		-- stylua: ignore
		keys = {
			{ "<leader>,",  function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
			{ "<leader>/",  function() Snacks.picker.grep() end,                                    desc = "Grep" },
			{ "<leader>:",  function() Snacks.picker.command_history() end,                         desc = "Command History" },
			{ "<leader>nt", function() Snacks.explorer() end,                                       desc = "File Explorer" },
			-- find
			{ "<leader>f",  function() Snacks.picker.files() end,                                   desc = "Find Files" },
			{ "<leader>sc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			{ "<leader>sg", function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
			-- search
			{ "<leader>sC", function() Snacks.picker.commands() end,                                desc = "Commands" },
			{ "<leader>sh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
			{ "<leader>sk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
			{ "<leader>sm", function() Snacks.picker.marks() end,                                   desc = "Marks" },
			{ "<leader>sq", function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
			{ "<leader>su", function() Snacks.picker.undo() end,                                    desc = "Undo History" },
			{ "<leader>uC", function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {
			skip_confirm_for_simple_edits = true,
			delete_to_trash = true,
			default_file_explorer = true,
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
			vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
			vim.keymap.set("n", "<leader>sr", "<CMD>GrugFar<CR>", { desc = "Open Search and Replace (GrugFar)" })
		end,
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
	{ "tpope/vim-sleuth" },
}
