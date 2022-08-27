local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
    return
end

zen_mode.setup({
	options = {
		signcolumn = "yes", -- disable signcolumn
		number = true, -- disable number column
		relativenumber = true, -- disable relative numbers
		-- cursorline = false, -- disable cursorline
		-- cursorcolumn = false, -- disable cursor column
		-- foldcolumn = "0", -- disable fold column
		-- list = false, -- disable whitespace characters
	},
})
