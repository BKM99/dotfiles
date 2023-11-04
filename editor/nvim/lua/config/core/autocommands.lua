-- -- Remove whitespace at end of lines
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
-- 	pattern = { "*" },
-- 	command = [[%s/\s\+$//e]],
-- })

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

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
