return {
	"nvim-telescope/telescope.nvim",
	version = "*",
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
		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					".git/",
					"dotbot/",
					"node_modules/",
				},
			},
		})
		pcall(telescope.load_extension, "fzf")
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap.set

		keymap("n", "<leader>b", ":Telescope buffers previewer=false theme=ivy <CR>", opts)
		keymap("n", "<leader>gf", ":Telescope git_files previewer=false theme=ivy <CR>", opts)
		keymap("n", "<leader>f", ":Telescope find_files hidden=true previewer=false theme=ivy <CR>", opts)
		keymap("n", "<leader>lg", ":Telescope live_grep theme=ivy <CR>", opts)
		keymap("n", "<leader>gs", ":Telescope git_status theme=ivy <CR>", opts)
		keymap("n", "<leader>gc", ":Telescope git_commits theme=ivy <CR>", opts)
		keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find theme=ivy <CR>", opts)
		keymap("n", "<leader>km", ":Telescope keymaps theme=ivy <CR>", opts)
		keymap("n", "<leader>ht", ":Telescope help_tags theme=ivy <CR>", opts)
		keymap(
			"n",
			"<leader>od",
			':lua require("telescope.builtin").find_files { prompt_title = "dotfiles", cwd = "~/.dotfiles/" } <CR>',
			opts
		)

	end,
}
