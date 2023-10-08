return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"ray-x/lsp_signature.nvim",
				opts = {
					doc_lines = 0,
				},
				config = function(_, opts)
					require("lsp_signature").setup(opts)
				end,
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			require("lspconfig.ui.windows").default_options.border = "single"
			local lsp_defaults = lspconfig.util.default_config
			local cmp_nvim_lsp_success, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

			if cmp_nvim_lsp_success then
				lsp_defaults.capabilities =
					vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_nvim_lsp.default_capabilities())
			end

			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "gl", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				desc = "LSP actions",
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					client.server_capabilities.semanticTokensProvider = nil

					local bufopts = { buffer = true }

					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
					vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>zz", bufopts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, bufopts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
					vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
					vim.keymap.set("n", "<space>lf", function()
						vim.lsp.buf.format({ async = true })
					end, bufopts)
				end,
			})

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			lspconfig.vimls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.pyright.setup({})
			lspconfig.clangd.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.gopls.setup({})
			lspconfig.omnisharp.setup({
				cmd = {
					os.getenv("HOME") .. "/.local/share/nvim/mason/packages/omnisharp/omnisharp",
					"--languageserver",
					"--hostPID",
					tostring(vim.fn.getpid()),
				},
				handlers = {
					["textDocument/definition"] = require("omnisharp_extended").handler,
				},
			})
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
	{ "mfussenegger/nvim-jdtls", ft = "java" },
	{ "Hoffs/omnisharp-extended-lsp.nvim", ft = "cs" },
}
