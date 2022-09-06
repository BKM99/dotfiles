local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup({
	use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>d", ":TroubleToggle<CR>", opts)
