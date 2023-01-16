return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local trouble = require("trouble")
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap.set

		keymap("n", "<leader>e", ":TroubleToggle<CR>", opts)

		trouble.setup({
			use_diagnostic_signs = true,
		})
	end,
}
