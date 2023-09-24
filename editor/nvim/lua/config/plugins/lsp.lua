return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mfussenegger/nvim-jdtls" },
			{ "Hoffs/omnisharp-extended-lsp.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")
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
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
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
					-- "/Users/brandonmorimoto/.local/share/nvim/mason/packages/omnisharp/omnisharp",
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
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",

				"vim-language-server",

				"typescript-language-server",
				"prettier",
				"eslint-lsp",

				"rust-analyzer",

				"clangd",
				"clang-format",

				"pyright",
				"black",
				"flake8",

				"gopls",
				"omnisharp",

				-- "shellcheck",

				-- "json-lsp",
				-- "yaml-language-server",

				-- "bash-language-server",
				"delve",
				"debugpy",
				"js-debug-adapter",
				"codelldb",
				"java-debug-adapter",
				"java-test",
			},
		},
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
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", opts = {} },
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					-- null_ls.builtins.formatting.prettier,
					-- null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.formatting.black,
					-- null_ls.builtins.diagnostics.flake8,
				},
			})
		end,
	},
}
