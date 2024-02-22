vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		-- vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
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

-- jump to last edit position on opening file
-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	pattern = "*",
-- 	callback = function(ev)
-- 		if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
-- 			-- except for in git commit messages
-- 			-- https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
-- 			if not vim.fn.expand("%:p"):find(".git", 1, true) then
-- 				vim.cmd('exe "normal! g\'\\""')
-- 			end
-- 		end
-- 	end,
-- })
