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
			pickers = {
				find_files = {
					hidden = true,
					follow = true,
					disable_devicons = true,
				},
				live_grep = {
					disable_devicons = true,
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
				git_files = {
					disable_devicons = true,
				},
				old_files = {
					disable_devicons = true,
				},
				buffers = {
					disable_devicons = true,
				},
			},
			defaults = {
				file_ignore_patterns = {
					".git/",
					"node_modules/",
					".venv/",
					"dist/",
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
		keymap("n", "<leader>of", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		keymap("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
		keymap("n", "<leader>,", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
	end,
}
