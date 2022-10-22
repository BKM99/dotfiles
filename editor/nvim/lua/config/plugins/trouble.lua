local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>e", ":TroubleToggle<CR>", opts)

trouble.setup({
	use_diagnostic_signs = true,
})
