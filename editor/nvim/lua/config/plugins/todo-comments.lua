local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	return
end

todo_comments.setup()

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>td", ":TodoTelescope<CR>", opts)
