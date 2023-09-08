local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Open netrw
keymap("n", "<leader>t", ":Explore<CR>", opts)

-- Faster window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- go through quickfix list
keymap("n", "]q", ":cnext<CR>zz", opts)
keymap("n", "[q", ":cprevious<CR>zz", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -1<CR>", opts)
keymap("n", "<A-Down>", ":resize +1<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +1<CR>", opts)

-- Go between the last two buffers
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

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
