local ok, neorg = pcall(require, "neorg")
if not ok then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					notes = "~/Documents/Notes/norg/notes",
					journals = "~/Documents/Notes/norg/journals",
					gtd = "~/Documents/Notes/norg/gtd_workspace",
				},
			},
		},
		["core.norg.concealer"] = {},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.integrations.telescope"] = {},
		["core.gtd.base"] = {
			config = {
				workspace = "gtd",
			},
		},
	},
})


local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>nc", ":Neorg gtd capture <CR>", opts)
keymap("n", "<leader>ne", ":Neorg gtd edit <CR>", opts)
keymap("n", "<leader>nv", ":Neorg gtd views <CR>", opts)
keymap("n", "<leader>ni", ":Neorg index <CR>", opts)
keymap("n", "<leader>nw", ":Telescope neorg switch_workspace <CR>", opts)
keymap("n", "<leader>nt", ":Telescope neorg find_context_tasks <CR>", opts)
