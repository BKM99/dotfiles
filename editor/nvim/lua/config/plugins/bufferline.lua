local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
		right_mouse_command = "",
		left_mouse_command = nil,
		middle_mouse_command = nil,
	},
})
