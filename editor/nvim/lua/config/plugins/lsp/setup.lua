return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("lspconfig.ui.windows").default_options.border = "single"
			require("config.plugins.lsp.server_setup")
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
				},
			})
		end,
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
			-- vim.keymap.set("", "<Leader>gl", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
		end,
		keys = {
			{ "<leader>gl", "<cmd> lua require('lsp_lines').toggle() <cr>", desc = "Toggle lsp_lines" },
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		opts = {
			doc_lines = 0,
		},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{ "mfussenegger/nvim-jdtls", ft = "java" },
	{ "Hoffs/omnisharp-extended-lsp.nvim", ft = "cs" },
}
