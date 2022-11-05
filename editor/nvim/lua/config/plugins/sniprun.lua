local ok, sniprun = pcall(require, "sniprun")
if not ok then
	return
end

sniprun.setup({
	display = { "Classic" },
})

vim.keymap.set("n", "<leader>sr", ":SnipRun <CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>sr", ":SnipRun <CR>", { noremap = true, silent = true })
