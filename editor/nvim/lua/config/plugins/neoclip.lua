local ok, neoclip = pcall(require, "neoclip")
if not ok then
    return
end

local status_ok_telescope, telescope = pcall(require, "telescope")
if not status_ok_telescope then
	return
else
	telescope.load_extension("neoclip")
end

vim.keymap.set("n", "<leader>nc", ":Telescope neoclip<CR>", { desc = "Neoclip Telescope Picker"})

neoclip.setup()
