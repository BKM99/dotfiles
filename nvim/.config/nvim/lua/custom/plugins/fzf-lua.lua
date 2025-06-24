return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		opts = {
			-- { "ivy" },
		},
		keys = {
			{
				"<leader>f",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files",
			},
		},
	},
}
