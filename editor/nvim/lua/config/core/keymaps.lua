local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Faster saving
keymap("n", "<leader>w", ":w<CR>", opts)

-- Toggle netrw
keymap("n", "<leader>t", ":Lexplore<CR>", opts)

-- Faster window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Naviagate buffers
keymap("n", "]b", ":bnext<CR>", opts)
keymap("n", "[b", ":bprevious<CR>", opts)

-- open quickfix list
keymap("n", "<leader>q", ":copen<CR>", opts)

-- go through quickfix list
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "[q", ":cprevious<CR>", opts)

-- create new space above and blow without going into insert mode
keymap("n", "[<space>", "O<down><ESC>", opts)
keymap("n", "]<space>", "o<up><ESC>", opts)

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

-- using delete without yank
keymap({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yank" })

-- Indent text without leaving
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- open file in the buffer's current path
keymap("n", "<leader>e", ":e <C-R>=expand('%:p:h') . '/' <CR>", { noremap = true })

-- move line by line
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Center things
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Very magic
vim.cmd([[
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/
]])

-- Search and replace in current word (case sensitive)
keymap(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "Replace current word (case sensitive)" }
)
keymap(
	"v",
	"<leader>s",
	":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "Replace current word (case sensitive)" }
)

vim.cmd([[
nmap gx :!open <c-r><c-a>
]])
