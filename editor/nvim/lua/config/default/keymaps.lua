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

-- Resize with arrows
keymap("n", "<m-Up>", ":resize -1<CR>", opts)
keymap("n", "<m-Down>", ":resize +1<CR>", opts)
keymap("n", "<m-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<m-Right>", ":vertical resize +1<CR>", opts)

-- Splits
keymap("n", "<leader>vs", ":vsplit <CR>", opts)
keymap("n", "<leader>hs", ":split <CR>", opts)

-- Go between the last two buffers
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Buffer Delete
keymap("n", "<m-q>", ":bdelete<CR>", opts)

-- Tabs
keymap("n", "<m-t>", ":tabnew %<cr>", opts) -- create new tab
keymap("n", "<m-y>", ":tabclose<cr>", opts) -- close current tab
keymap("n", "<m-\\>", ":tabonly<cr>", opts) -- close all tabs

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Select all
keymap("n", "<m-a>", "gg <S-v> G", opts)

-- Better pasting in visual mode
keymap("v", "p", '"_dP', opts)

-- Indent text
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
