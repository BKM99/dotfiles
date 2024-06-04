return {
	-- { "j-hui/fidget.nvim", opts = {} },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
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
					-- local client = vim.lsp.get_client_by_id(event.data.client_id)
					local nmap = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local vim_lsp_buf = vim.lsp.buf

					nmap("gd", vim_lsp_buf.definition, "[G]oto [D]efinition")
					nmap("gr", vim_lsp_buf.references, "[G]oto [R]eferences")
					nmap("gI", vim_lsp_buf.implementation, "[G]oto [I]mplementation")
					nmap("<leader>D", vim_lsp_buf.type_definition, "Type [D]efinition")
					nmap("gD", vim_lsp_buf.declaration, "[G]oto [D]eclaration")
					nmap("<leader>rn", vim_lsp_buf.rename, "[R]e[n]ame")
					vim.keymap.set({ "n", "v" }, "<leader>ca", function()
						vim_lsp_buf.code_action()
					end, { desc = "LSP Code Actions" })
					nmap("K", vim_lsp_buf.hover, "Hover Documentation")
					nmap("gS", vim_lsp_buf.signature_help, "Signature Documentation")
					vim.keymap.set({ "n", "v" }, "<leader>lf", function()
						vim_lsp_buf.format({ async = false })
					end, { desc = "LSP Format" })
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = opts.servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
