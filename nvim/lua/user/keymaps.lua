local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd([[
nmap <leader>w :w<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

"fzf key remap
nmap <leader>f :Telescope find_files theme=ivy<CR>
nmap <leader>b :Telescope buffers theme=dropdown previewer=false<CR>
nmap <leader>g :Telescope live_grep<CR>

" Nvim Tree toggle
nmap <leader>t :NvimTreeToggle<CR>

" pressing esc will get rid of the highlight after searching with /
nnoremap <silent> <Esc> <Esc>:noh<CR>

]])

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
