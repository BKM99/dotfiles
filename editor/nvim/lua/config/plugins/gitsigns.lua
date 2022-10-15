local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "[h", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "]h", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", opts)

gitsigns.setup()
