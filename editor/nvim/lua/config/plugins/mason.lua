return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			PATH = "skip",
			max_concurrent_installers = 10,
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"vim-language-server",
				"typescript-language-server",
				"prettier",
				"eslint_d",
				"rust-analyzer",
				"clangd",
				"clang-format",
				"pyright",
				"black",
				"flake8",
				"gopls",
				"omnisharp",
				"jdtls",
				"shellcheck",
				"json-lsp",
				"yaml-language-server",
				"bash-language-server",
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

			-- add binaries installed by mason.nvim to path
			local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
			vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
		},
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
}
