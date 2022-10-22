local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
else
	vim.cmd([[ hi Comment guifg=#8f8c8c ]])
end
