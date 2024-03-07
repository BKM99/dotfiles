local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.colors = {
	foreground = "white",
	background = "#161617",
	-- cursor_border = "#AAAA00",
	cursor_bg = "9E9E9E",
}
config.underline_thickness = "1.2pt"
config.tab_bar_at_bottom = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.font_size = 13
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"FiraCode Nerd Font",
	"Menlo",
})
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- disable ligatures
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

return config
