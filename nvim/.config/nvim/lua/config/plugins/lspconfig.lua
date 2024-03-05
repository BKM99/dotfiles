return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		servers = {},
	},
	config = function(_, opts)
		vim.lsp.handlers["textDocument/definition"] = function(_, result)
			if not result or vim.tbl_isempty(result) then
				print("[LSP] Could not find definition")
				return
			end

			if vim.tbl_islist(result) then
				vim.lsp.util.jump_to_location(result[1], "utf-8")
			else
				vim.lsp.util.jump_to_location(result, "utf-8")
			end
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
			callback = function(event)
				local telescope_builtin = require("telescope.builtin")
				local nmap = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local vim_lsp_buf = vim.lsp.buf

				nmap("gd", vim_lsp_buf.definition, "[G]oto [D]efinition")
				nmap("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
				nmap("gI", vim_lsp_buf.implementation, "[G]oto [I]mplementation")
				nmap("<leader>D", vim_lsp_buf.type_definition, "Type [D]efinition")
				nmap("<leader>ds", telescope_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				nmap("gD", vim_lsp_buf.declaration, "[G]oto [D]eclaration")
				nmap("<leader>rn", vim_lsp_buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", function()
					vim_lsp_buf.code_action()
				end, "[C]ode [A]ction")
				nmap("K", vim_lsp_buf.hover, "Hover Documentation")
				nmap("gS", vim_lsp_buf.signature_help, "Signature Documentation")
				nmap("<leader>lf", function()
					vim_lsp_buf.format({
						bufnr = event.buf,
						async = false,
						-- filter = function(client)
						-- 	return client.name == "null-ls"
						-- end,
					})
				end, "Format")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = opts.servers[server_name] or {}
					require("lspconfig")[server_name].setup({
						cmd = server.cmd,
						settings = server.settings,
						filetypes = server.filetypes,
						capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
						-- handlers = server.handlers or {},
						on_init = function(client, _)
							client.server_capabilities.semanticTokensProvider = nil
						end,
					})
				end,
			},
		})
	end,
}
