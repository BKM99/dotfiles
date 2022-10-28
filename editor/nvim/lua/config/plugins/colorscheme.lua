local colorscheme = "base16-gruvbox-dark-hard"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.cmd("colorscheme lunaperche")
end

vim.cmd([[
hi Comment guifg=#8f8c8c
]])
-- vim.cmd([[ hi Comment guifg=#8f8c8c
-- " hi Normal guibg=#1a1b26
-- " hi Normal guibg=#292828
-- " hi Normal ctermfg=NONE
-- " hi Normal ctermbg=NONE
-- ]])
