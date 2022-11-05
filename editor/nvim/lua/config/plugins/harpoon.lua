local harpoon_status_ok, _ = pcall(require, "harpoon")
if not harpoon_status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file() <CR>", opts)
keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1) <CR>", opts)
keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2) <CR>", opts)
keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3) <CR>", opts)
keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4) <CR>", opts)
keymap("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5) <CR>", opts)
keymap("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu() <CR>", opts)
