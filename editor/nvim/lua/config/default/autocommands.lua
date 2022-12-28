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

-- When opening a file go to last location
vim.cmd([[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif ]])

-- windows to close
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "help",
        "qf",
        "lspinfo",
        "vim",
        "floggraph",
        "git",
        "query",
        "tsplayground",
    },
    command = [[nnoremap <buffer><silent> q :close<CR>]],
})

-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
    command = [[call mkdir(expand('<afile>:p:h'), 'p')]],
})
