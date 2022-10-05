local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

hop.setup({ keys = "qwerpoiasdflkjmxv" })

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>h", ":HopWord<cr>", opts)
keymap("n", "<leader>s", ":HopChar2<cr>", opts)
keymap("n", "<leader>/", ":HopPattern<cr>", opts)

keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
