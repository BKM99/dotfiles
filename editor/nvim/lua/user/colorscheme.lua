local colorscheme = "base16-tomorrow-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    print("colorscheme was not loaded")
    return
end
