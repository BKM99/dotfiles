local base_16_status_ok, base16_colorscheme = pcall(require, "base16-colorscheme")
if not base_16_status_ok then
	return
else
	base16_colorscheme.setup({
		base00 = "#1d2021",
		base01 = "#3a3a3a",
		base02 = "#4e4e4e",
		base03 = "#8a8a8a",
		base04 = "#949494",
		base05 = "#dab997",
		base06 = "#d5c4a1",
		base07 = "#ebdbb2",
		base08 = "#d75f5f",
		base09 = "#ff8700",
		base0A = "#ffaf00",
		base0B = "#afaf00",
		base0C = "#85ad85",
		base0D = "#83adad",
		base0E = "#d485ad",
		base0F = "#d65d0e",
	})
end
