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

-- Naviagate buffers
keymap("n", "]b", ":bnext<CR>", opts)
keymap("n", "[b", ":bprevious<CR>", opts)

-- Delete buffer
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Resize with arrows
keymap("n", "<m-Up>", ":resize -1<CR>", opts)
keymap("n", "<m-Down>", ":resize +1<CR>", opts)
keymap("n", "<m-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<m-Right>", ":vertical resize +1<CR>", opts)

-- Go between the last two buffers
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Paste over selected text without yanking
keymap("v", "p", '"_dP', opts)
keymap("v", "P", '"_dP', opts)

-- delete to black hole register
keymap("n", "x", '"_x', opts)
-- keymap("n", "<leader>d", "\"_d", opts)
-- keymap("v", "<leader>d", "\"_d", opts)

-- Indent text without leaving
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- open file in the buffer's current path
keymap("n", "<leader>o", ":e <C-R>=expand('%:p:h') . '/' <CR>", { noremap = true })

-- -- open dotfiles
-- keymap("n", "<leader>od", ":e ~/.dotfiles/ <CR>", opts)

-- move line by line
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- scroll horizontally faster
keymap("n", "zl", "25zl<CR>", opts)
keymap("n", "zh", "25zh<CR>", opts)

-- Replace word under cursor on current line only
keymap("n", "<leader>r", ":.s/\\<<C-r><C-w>\\>/<C-r><C-w>/<Left>")

-- Center searches
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- center screen when scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- open quickfix list
keymap("n", "<leader>qf", ":copen<CR>", opts)

-- go through quickfix list
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "[q", ":cprevious<CR>", opts)

-- I disabled netrw because of nvim tree, using this keybind to open URL under cursor
vim.cmd([[ nmap gx :!open <c-r><c-a> ]])

-- open refile
keymap("n", "<leader>c", ":split ~/Documents/Dropbox/Notes/refile.md <CR>")
