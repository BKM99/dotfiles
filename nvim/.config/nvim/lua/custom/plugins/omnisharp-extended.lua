return {
	{
		"Hoffs/omnisharp-extended-lsp.nvim",
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "Override keymaps for OmniSharp",
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client or client.name ~= "omnisharp" then
						return
					end

					local bufnr = args.buf
					local ok, omnisharp_extended = pcall(require, "omnisharp_extended")
					if not ok then
						return
					end

					local function keymap(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end

					keymap("n", "gd", omnisharp_extended.lsp_definition, "OmniSharp: Go to Definition")
					keymap("n", "gry", omnisharp_extended.lsp_type_definition, "OmniSharp: Type Definition")
					keymap("n", "grr", omnisharp_extended.lsp_references, "OmniSharp: References")
					keymap("n", "gri", omnisharp_extended.lsp_implementation, "OmniSharp: Implementation")
				end,
			})
		end,
	},
}
