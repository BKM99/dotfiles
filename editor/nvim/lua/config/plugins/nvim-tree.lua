local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
-- Nvim Tree toggle
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

nvim_tree.setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
		indent_markers = {
			enable = true,
		},
	},
	filters = {
		dotfiles = false,
	},
})
