return {
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
			vim.keymap.set("n", "<leader>sr", "<CMD>GrugFar<CR>", { desc = "Open Search and Replace (GrugFar)" })
		end,
	},
}
