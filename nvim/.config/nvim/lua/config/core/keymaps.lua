local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Faster window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- keymap("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- go through quickfix list
keymap("n", "[q", ":cprevious<CR>zz", opts)
keymap("n", "]q", ":cnext<CR>zz", opts)

-- diagnostic keymaps
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap("n", "gl", vim.diagnostic.open_float, { desc = "Open float" })
keymap("n", "<leader>qd", vim.diagnostic.setqflist, { desc = "Set quickfix list" })
keymap("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Set location list" })

-- Resize windows with arrow keys
keymap("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Go between the last two buffers
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- delete to black hole register
keymap("v", "p", '"_dP', opts)
keymap("v", "P", '"_dP', opts)
keymap("n", "x", '"_x', opts)

-- Center things
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })