local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

keymap("n", "[q", ":cprevious<CR>zz", opts)
keymap("n", "]q", ":cnext<CR>zz", opts)

keymap("n", "[b", ":bprev<CR>", opts)
keymap("n", "[b", ":bprev<CR>", opts)

keymap("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<A-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<A-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

keymap("n", "<space><space>", "<c-^>", opts)

keymap("x", "p", '"_dP', opts)
keymap("x", "P", '"_dP', opts)
keymap("n", "x", '"_x', opts)

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "<leader>h", "<cmd>nohlsearch<CR>")

keymap("n", "<leader>ru", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Replace word under the cursor" })
keymap("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Append Text after cursor" })
