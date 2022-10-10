local status_ok, registers = pcall(require, "registers")
if not status_ok then
	return
end

registers.setup({
	window = {
		max_width = 100,
		highlight_cursorline = true,
		border = "rounded",
		transparency = 10,
	},
	symbols = {
		newline = "",
		space = " ",
		tab = "",
		register_type_charwise = "",
		register_type_linewise = "",
		register_type_blockwise = "",
	},
})
