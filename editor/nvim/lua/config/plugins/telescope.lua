local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			".git/",
			"dotbot/",
			"node_modules/",
		},
	},
})

telescope.load_extension("fzf")

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>gf", ":Telescope git_files previewer=false theme=ivy <CR>", opts)
keymap("n", "<leader>f", ":Telescope find_files hidden=true previewer=false theme=ivy <CR>", opts)
keymap("n", "<leader>g", ":Telescope live_grep theme=ivy <CR>", opts)
keymap("n", "<leader>gs", ":Telescope grep_string theme=ivy <CR>", opts)
keymap("n", "<leader>/", ":Telescope current_buffer_fuzzy_find theme=ivy <CR>", opts)
keymap("n", "<leader>km", ":Telescope keymaps theme=ivy <CR>", opts)
keymap("n", "<leader>ht", ":Telescope help_tags theme=ivy <CR>", opts)
keymap(
	"n",
	"<leader>od",
	':lua require("telescope.builtin").find_files { prompt_title = "dotfiles", cwd = "~/.dotfiles/" } <CR>',
	opts
)
