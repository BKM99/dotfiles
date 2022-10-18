local ok, todo_commnets = pcall(require, "todo-comments")
if not ok then
	return
end

todo_commnets.setup()

vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "<leader>tc", ":TodoTelescope<CR>", { desc = "Todo Telescope" })
