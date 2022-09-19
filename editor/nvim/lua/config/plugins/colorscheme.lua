-- local colorscheme = "base16-gruvbox-dark-hard"

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
-- 	print("colorscheme was not loaded")
-- 	return
-- end

-- Slightly modified base16-gruvbox-dark-hard, I changed base03 to #8f8c8c
local base_16_status_ok, base16_colorscheme = pcall(require, "base16-colorscheme")
if not base_16_status_ok then
    return
end

base16_colorscheme.setup({
	base00 = "#1d2021",
	base01 = "#3c3836",
	base02 = "#504945",
	base03 = "#8f8c8c",
	base04 = "#bdae93",
	base05 = "#d5c4a1",
	base06 = "#ebdbb2",
	base07 = "#fbf1c7",
	base08 = "#fb4934",
	base09 = "#fe8019",
	base0A = "#fabd2f",
	base0B = "#b8bb26",
	base0C = "#8ec07c",
	base0D = "#83a598",
	base0E = "#d3869b",
	base0F = "#d65d0e",
})

--
vim.cmd([[
hi DiagnosticError guifg=#f50707
hi DiagnosticWarn guifg=#f5c907
hi DiagnosticInfo guifg=#34c6eb
hi DiagnosticHint guifg=#34eb80
]])
