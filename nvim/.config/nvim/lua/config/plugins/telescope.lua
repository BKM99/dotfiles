return {
	"nvim-telescope/telescope.nvim",
	version = false,
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		telescope.setup({
			extensions = {
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					follow = true,
					disable_devicons = true,
					previewer = false,
					theme = "ivy",
				},
				git_files = {
					show_untracked = true,
					disable_devicons = true,
				},
				old_files = {
					disable_devicons = true,
				},
				buffers = {
					sort_mru = true,
					ignore_current_buffer = true,
					disable_devicons = true,
				},
				keymaps = {
					layout_config = {},
				},
				git_status = {
					layout_config = {},
				},
			},
			defaults = {
				file_ignore_patterns = {
					".git/",
					"node_modules/",
					".venv/",
					"dist/",
					".*%.png$",
					".*%.jpg$",
					".*%.jpeg$",
					".*%.gif$",
					".*%.wav$",
					".*%.aiff$",
					".*%.dll$",
					".*%.pdb$",
					".*%.mdb$",
					".*%.so$",
					".*%.swp$",
					".*%.zip$",
					".*%.gz$",
					".*%.bz2$",
					".*%.meta",
					".*%.cache",
				},
			},
		})
		pcall(telescope.load_extension, "fzf")
		local keymap = vim.keymap.set

		keymap("n", "<leader>gs", builtin.git_status, { desc = "Telescope Git Status" })
		keymap("n", "<leader>ht", builtin.help_tags, { desc = "Search [H]elp [T]ags" })
		keymap("n", "<leader>km", builtin.keymaps, { desc = "Search [K]ey[m]aps" })
		keymap("n", "<leader>f", builtin.find_files, { desc = "Search [F]iles" })
		keymap("n", "<leader>lg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		keymap("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		keymap("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		keymap("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
		keymap("n", "<leader>,", builtin.buffers, { desc = "[ ] Find existing buffers" })
	end,
}
