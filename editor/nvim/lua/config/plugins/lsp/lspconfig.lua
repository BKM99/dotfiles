local lspconfig = require("lspconfig")

local mason = require("mason")

local mason_lspconfig = require("mason-lspconfig")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local servers = {
	"jsonls",
	"sumneko_lua",
	"clangd",
	"tsserver",
	"gopls",
	"html",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
	"yamlls",
	"cssls",
	"eslint",
	"jdtls",
	"elixirls",
	"angularls",
}

mason_lspconfig.setup({
	ensure_installed = servers,
})

local tools = {
	"js-debug-adapter",
	"delve",
	"black",
	"flake8",
	"prettierd",
	"stylua",
	"codelldb",
	"java-debug-adapter",
	"java-test",
	"gofumpt",
	"goimports",
}

-- Install tools
local mr = require("mason-registry")
for _, tool in ipairs(tools) do
	local p = mr.get_package(tool)
	if not p:is_installed() then
		p:install()
	end
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("config.plugins.lsp.lsp-handlers").on_attach,
		capabilities = require("config.plugins.lsp.lsp-handlers").capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
						    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
						    [vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		}
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = {
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "basic",
						diagnosticMode = "workspace",
						inlayHints = {
							variableTypes = true,
							functionReturnTypes = true,
						},
					},
				},
			},
		}
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "jsonls" then
		local jsonls_opts = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
				},
			},
		}
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server == "tailwindcss" then
		local tailwindcss_opts = {
			root_dir = require("lspconfig").util.root_pattern("tailwind.config.js"),
		}
		opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
	end

	if server == "jdtls" then
		goto continue
	end

	if server == "elixirls" then
		local elixirls_opts = {
			cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
			settings = {
				elixirLS = {
					dialyzerEnabled = false,
					fetchDeps = false,
				},
			},
		}

		opts = vim.tbl_deep_extend("force", elixirls_opts, opts)
	end

	lspconfig[server].setup(opts)
	::continue::
end
