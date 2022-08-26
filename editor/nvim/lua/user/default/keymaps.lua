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

-- Nvim Tree toggle
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files theme=ivy <CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers theme=ivy <CR>", opts)
keymap("n", "<leader>g", ":Telescope live_grep theme=ivy <CR>", opts)
keymap("n", "<leader>cb", ":Telescope current_buffer_fuzzy_find theme=ivy <CR>", opts)
keymap("n", "<leader>km", ":Telescope keymaps theme=ivy <CR>", opts)

-- Harpoon
keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file() <CR>", opts)
keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1) <CR>", opts)
keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2) <CR>", opts)
keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3) <CR>", opts)
keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4) <CR>", opts)
keymap("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu() <CR>", opts)


-- Trouble
keymap("n", "<leader>d", ":TroubleToggle <CR>", opts)

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

-- Toggle between buffers
keymap("n", "<leader><leader>", "<c-^>", opts)

-- Bufferline Stuff
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Buffer Delete
keymap("n", "<m-q>", ":bdelete<CR>", opts)

-- Tabs --
keymap("n", "<m-t>", ":tabnew %<cr>", opts) -- create new tab
keymap("n", "<m-y>", ":tabclose<cr>", opts) -- close current tab
keymap("n", "<m-\\>", ":tabonly<cr>", opts) -- close all tabs

-- Turn off highlight after searching
keymap("n", "<esc><esc>", ":silent! nohls<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Select all
keymap("n", "<m-a>", "gg <S-v> G", opts)

-- Better pasting in visual mode
keymap("v", "p", '"_dP', opts)

-- Neoclip
keymap("n", "<leader>nc", ":Telescope neoclip <CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- DAP Stuff
keymap("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
keymap("n", "<S-up>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<S-right>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<S-left>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<S-down>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts) -- open and close
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- TODO: add more git mappings
-- Git Stuff
keymap("n", "<leader>gb", ":Gitsigns blame_line <CR>")
keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>")
