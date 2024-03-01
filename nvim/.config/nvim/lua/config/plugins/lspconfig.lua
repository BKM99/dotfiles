return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {
				ensure_installed = {
					"lua-language-server",
					"vim-language-server",
					"gopls",
					"typescript-language-server",
					"rust-analyzer",
					"clangd",
					"pyright",
					"bash-language-server",

					"prettier",
					"clang-format",
					"stylua",
					"black",
					"gofumpt",
					"goimports",

					"delve",
					"debugpy",
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
		},
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
			callback = function(event)
				local telescope_builtin = require("telescope.builtin")
				local nmap = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local vim_lsp_buf = vim.lsp.buf

				nmap("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
				nmap("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
				nmap("gI", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")
				nmap("<leader>D", telescope_builtin.lsp_type_definitions, "Type [D]efinition")
				nmap("<leader>ds", telescope_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				nmap("gD", vim_lsp_buf.declaration, "[G]oto [D]eclaration")
				nmap("<leader>rn", vim_lsp_buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", function()
					vim_lsp_buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
				end, "[C]ode [A]ction")
				nmap("K", vim_lsp_buf.hover, "Hover Documentation")
				nmap("gS", vim_lsp_buf.signature_help, "Signature Documentation")
				nmap("<leader>lf", function()
					vim_lsp_buf.format({ async = true })
				end, "Format")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			clangd = {},
			gopls = {},
			pyright = {},
			rust_analyzer = {},
			tsserver = {},
			omnisharp = {
				cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
				root_dir = vim.loop.cwd,
			},
			bashls = {},
			vimls = {},
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						diagnostics = { disable = { "missing-fields" } },
					},
				},
			},
		}

		require("mason").setup()
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					require("lspconfig")[server_name].setup({
						cmd = server.cmd,
						settings = server.settings,
						filetypes = server.filetypes,
						capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
						on_init = function(client, _)
							client.server_capabilities.semanticTokensProvider = nil
						end,
					})
				end,
			},
		})
	end,
}
