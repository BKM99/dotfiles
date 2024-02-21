return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- {
			-- 	"nvim-java/nvim-java",
			-- 	dependencies = {
			-- 		"nvim-java/lua-async-await",
			-- 		"nvim-java/nvim-java-core",
			-- 		"nvim-java/nvim-java-test",
			-- 		"nvim-java/nvim-java-dap",
			-- 		"MunifTanjim/nui.nvim",
			-- 		"neovim/nvim-lspconfig",
			-- 		"mfussenegger/nvim-dap",
			-- 		{
			-- 			"williamboman/mason.nvim",
			-- 			opts = {
			-- 				registries = {
			-- 					"github:nvim-java/mason-registry",
			-- 					"github:mason-org/mason-registry",
			-- 				},
			-- 			},
			-- 		},
			-- 	},
			-- },
			-- {
			-- 	"iabdelkareem/csharp.nvim",
			-- 	dependencies = {
			-- 		"williamboman/mason.nvim", -- Required, automatically installs omnisharp
			-- 		"mfussenegger/nvim-dap",
			-- 		"Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
			-- 	},
			-- 	config = function()
			-- 		require("mason").setup() -- Mason setup must run before csharp
			-- 		require("csharp").setup()
			-- 	end,
			-- },
		},
		config = function()
			-- require('java').setup()
			local lspconfig = require("lspconfig")
			require("lspconfig.ui.windows").default_options.border = "single"

            -- TODO: need to set this part up
			-- local cmp_ok, cmp = pcall(require, "cmp")
			-- local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
			-- local capabilities = vim.tbl_deep_extend(
			-- 	"force",
			-- 	{},
			-- 	vim.lsp.protocol.make_client_capabilities(),
			-- 	cmp_lsp.default_capabilities()
			-- )

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
			lspconfig.omnisharp.setup({})
			lspconfig.bashls.setup({})
			lspconfig.jdtls.setup({})

			-- global keymaps
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "gl", vim.diagnostic.open_float)
			vim.keymap.set("n", "<leader>qd", vim.diagnostic.setqflist)
			vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<space>lf", function()
						vim.lsp.buf.format({ async = true })
					end, opts)

					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
		end,
	},
}
