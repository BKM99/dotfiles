return {
	{ "Hoffs/omnisharp-extended-lsp.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "c_sharp" })
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "csharpier", "omnisharp" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				omnisharp = {
					on_init = function(client, _)
						client.server_capabilities.semanticTokensProvider = nil
					end,
					handlers = {
						["textDocument/definition"] = function(...)
							return require("omnisharp_extended").handler(...)
						end,
					},
				},
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		optional = true,
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = opts.sources or {}
			table.insert(opts.sources, nls.builtins.formatting.csharpier)
		end,
	},
}
