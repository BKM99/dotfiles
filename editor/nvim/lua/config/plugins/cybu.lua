local ok, cybu = pcall(require, "cybu")
if not ok then
	return
end

cybu.setup()

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "L", "<Plug>(CybuPrev)", opts)
keymap("n", "H", "<Plug>(CybuNext)", opts)
