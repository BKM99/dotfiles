local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "]h", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[h", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", opts)
keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", opts)
keymap({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", opts)
keymap("n", "<leader>ghd", ":Gitsigns diffthis<CR>", opts)

gitsigns.setup()
