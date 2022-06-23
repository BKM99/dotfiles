-- local colorscheme = "catppuccin"
-- vim.g.catppuccin_flavour = "mocha"
-- local colorscheme = "base16-gruvbox-dark-hard"
local colorscheme = "kanagawa"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    print("colorscheme was not loaded")
    return
elseif (colorscheme == "base16-gruvbox-dark-hard") then
    vim.cmd [[highlight Comment guifg=#7f7f7f]]
    vim.cmd [[hi Normal ctermbg=NONE]]
end
