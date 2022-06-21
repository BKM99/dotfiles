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
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 }
    end,
})
