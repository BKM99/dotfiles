local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better saving
keymap("n", "<leader>w", ":w<CR>", opts)

-- Nvim Tree toggle
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Trouble
keymap("n", "<leader>d", "<cmd>TroubleToggle<cr>", opts)

-- Symbol Outline
keymap("n", "<leader>s", ":SymbolsOutline<cr>", opts)

-- Null-ls format
keymap("n", "<leader>nf", ":lua vim.lsp.buf.formatting_sync()<cr>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files theme=ivy<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers theme=dropdown previewer=false<CR>", opts)
keymap("n", "<leader>g", ":Telescope live_grep <CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Toggle between buffers
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Turn off highlight after searching
keymap("n", "<esc><esc>", ":silent! nohls<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- keymap("v", "p", '"_dP', opts)

-- keymap("n", "yy", '"+y', opts)
-- keymap("v", "yy", '"+y', opts)
