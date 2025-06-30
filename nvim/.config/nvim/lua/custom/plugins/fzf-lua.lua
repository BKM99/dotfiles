return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		opts = {
			-- { "ivy" },
		},
		keys = {
			{ "<leader>f", "<cmd>FzfLua files<cr>", desc = "Find files" },
			-- { "<leader>lg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
			{ "<leader>dd", "<cmd>FzfLua lsp_document_diagnostics<cr>", desc = "Document diagnostics" },
			{ "<leader>ht", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
		},
	},
}
