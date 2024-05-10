return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "pyright", "ruff-lsp", "debugpy" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {
					on_init = function(client, _)
						client.server_capabilities.semanticTokensProvider = nil
					end,
				},
				ruff_lsp = {},
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"mfussenegger/nvim-dap-python",
			-- stylua: ignore
			keys = {
				{ "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
				{ "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class",  ft = "python" },
			},
			config = function()
				local path = require("mason-registry").get_package("debugpy"):get_install_path()
				require("dap-python").setup(path .. "/venv/bin/python")
			end,
		},
	},
	-- {
	-- 	"linux-cultist/venv-selector.nvim",
	-- 	cmd = "VenvSelect",
	-- 	opts = function(_, opts)
	-- 		opts.dap_enabled = true
	-- 		return vim.tbl_deep_extend("force", opts, {
	-- 			name = {
	-- 				"venv",
	-- 				".venv",
	-- 				"env",
	-- 				".env",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
