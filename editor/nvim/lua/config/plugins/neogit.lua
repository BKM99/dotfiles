local ok, neogit = pcall(require, "neogit")
if not ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>gg", ":Neogit<CR>", opts)

neogit.setup({
	integrations = {
		diffview = true,
	},
})
