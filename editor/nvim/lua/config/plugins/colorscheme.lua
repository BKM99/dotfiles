local colorscheme = "catppuccin"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.cmd("colorscheme lunaperche")
end

vim.cmd([[ hi Comment guifg=#7d83ab]])
-- vim.cmd([[ hi Comment guifg=#8f8c8c ]])
