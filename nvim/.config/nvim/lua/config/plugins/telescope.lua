return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
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
				},
				live_grep = {
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
			},
			defaults = {
				file_ignore_patterns = {
					".git/",
					"node_modules/",
					".venv/",
				},
			},
		})
		pcall(require("telescope").load_extension, "fzf")
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap.set

		keymap("n", "<leader>gs", ":Telescope git_status theme=ivy <CR>", opts)

		vim.keymap.set("n", "<leader>ht", builtin.help_tags, { desc = "Search [H]elp [T]ags" })
		vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "Search [K]ey[m]aps" })
		vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Search [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sR", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
