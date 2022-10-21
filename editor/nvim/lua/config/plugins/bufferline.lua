local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
		separator_style = "thick", -- | "thick" | "thin" | { 'any', 'any' },
		right_mouse_command = "", -- stop right click from deleting buffer
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and "E" or "W"
			return " " .. icon .. count
		end,
	},
})
