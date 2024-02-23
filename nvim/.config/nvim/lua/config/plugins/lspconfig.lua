return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			opts = {
				PATH = "skip",
				max_concurrent_installers = 10,
				ensure_installed = {
					"lua-language-server",
					"vim-language-server",
					"gopls",
					"typescript-language-server",
					"rust-analyzer",
					"clangd",
					"pyright",
					"bash-language-server",
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

				-- add binaries installed by mason.nvim to path
				local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
				vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
			end,
		},
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		require("neodev").setup()

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("custom-lsp-attach", { clear = true }),
			callback = function(event)
				local nmap = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>ca", function()
					vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
				end, "[C]ode [A]ction")
				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
				nmap("<leader>lf", function()
					vim.lsp.buf.format({ async = true })
				end, "Format")
			end,
		})

		local capabilities_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		local capabilities
		if capabilities_ok then
			capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
		end

		local servers = {
			clangd = {},
			gopls = {},
			pyright = {},
			rust_analyzer = {},
			tsserver = {},
			bashls = {},
			vimls = {},
			lua_ls = {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
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
							client.server_capabilities.semanticTokensProvider = nil -- turn off semantic tokens
						end,
					})
				end,
			},
		})
	end,
}
