-- Remove whitespace at end of lines
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

-- Highlights text on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

-- better commenting options
vim.api.nvim_create_autocmd("BufEnter", {
	command = [[
            set formatoptions=tc
            set formatoptions+=r
            set formatoptions+=q
            set formatoptions+=n
            set formatoptions+=b
        ]],
})

-- create directories when needed, when saving a file
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
-- 	command = [[call mkdir(expand('<afile>:p:h'), 'p')]],
-- })
