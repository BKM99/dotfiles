local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end

hop.setup({ keys = "asdfgqwertzxcv" })

local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set("n", "<leader>hw", ":HopWord<CR>", { noremap = true, silent = true })
