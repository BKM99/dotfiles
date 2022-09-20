local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better saving
keymap("n", "<leader>w", ":w<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- -- Easier Buffer Switching
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)

-- Resize with arrows
keymap("n", "<m-Up>", ":resize -1<CR>", opts)
keymap("n", "<m-Down>", ":resize +1<CR>", opts)
keymap("n", "<m-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<m-Right>", ":vertical resize +1<CR>", opts)

-- Go between the last two buffers
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Buffer Delete
keymap("n", "<m-q>", ":bdelete<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Select all
keymap("n", "<m-a>", "ggVG", opts)

-- Better pasting in visual mode
keymap("v", "p", '"_dP', opts)

-- Indent text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)
