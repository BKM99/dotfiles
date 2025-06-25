local function setup_lsp_keymaps(client, bufnr)
	local function keymap(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	-- LSP Navigation
	keymap("n", "gd", vim.lsp.buf.definition, "LSP: [G]oto [D]efinition")
	keymap("n", "grr", vim.lsp.buf.references, "LSP: [G]oto [R]eferences")
	keymap("n", "gri", vim.lsp.buf.implementation, "LSP: [G]oto [I]mplementation")
	keymap("n", "gry", vim.lsp.buf.type_definition, "LSP: Type [D]efinition")
	keymap("n", "grd", vim.lsp.buf.declaration, "LSP: [G]oto [D]eclaration")

	-- Misc
	keymap("n", "grn", vim.lsp.buf.rename, "LSP: [R]e[n]ame")
	keymap("n", "K", vim.lsp.buf.hover, "LSP: Hover Documentation")
	keymap("n", "grs", vim.lsp.buf.signature_help, "LSP: Signature Documentation")
	keymap({ "n", "x" }, "gra", function()
		vim.lsp.buf.code_action()
	end, "LSP: Code Actions")
	keymap({ "n", "v" }, "<leader>lf", function()
		vim.lsp.buf.format({ async = false })
	end, "LSP: Format")
	keymap("n", "<leader>ld", function()
		vim.diagnostic.open_float(nil, { scope = "line" })
	end, "Show line diagnostics")

	local omnisharp_extended_ok, omnisharp_extended = pcall(require, "omnisharp_extended")
	if omnisharp_extended_ok and client.name == "omnisharp" then
		keymap("n", "gd", omnisharp_extended.lsp_definition, "OmniSharp: Go to Definition")
		keymap("n", "gry", omnisharp_extended.lsp_type_definition, "OmniSharp: Type Definition")
		keymap("n", "grr", omnisharp_extended.lsp_references, "OmniSharp: References")
		keymap("n", "gri", omnisharp_extended.lsp_implementation, "OmniSharp: Implementation")
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "Configure LSP keymaps",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		vim.diagnostic.config({
			virtual_text = true,
		})
		client.server_capabilities.semanticTokensProvider = nil
		setup_lsp_keymaps(client, args.buf)
	end,
})

return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			{ "neovim/nvim-lspconfig" },
			{ "b0o/SchemaStore.nvim", lazy = true },
			{ "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
		},
	},
}
