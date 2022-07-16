local colorscheme = "gruvbox"
vim.g.gruvbox_contrast_dark = "hard"
vim.g.gruvbox_bold = 0

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    print("colorscheme was not loaded")
    return
end

-- vim.cmd [[highlight Comment guifg=#7f7f7f]]
-- vim.cmd [[hi Normal ctermbg=NONE]]
