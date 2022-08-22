-- Removes whitespace at end of line, doesn't include markdown
if vim.bo.filetype ~= "markdown" then
	vim.api.nvim_create_autocmd({ "BufWritePre" }, {
		pattern = { "*" },
		command = [[%s/\s\+$//e]],
	})
end

-- Highlights text on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
