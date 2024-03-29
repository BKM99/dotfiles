return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"lua",
				"vim",
				"vimdoc",
				"luadoc",
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "lua-language-server", "stylua" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				lua_ls = {
					on_init = function(client, _)
						local path = client.workspace_folders[1].name
						if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
							return
						end
						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								version = "LuaJIT",
							},
							workspace = {
								checkThirdParty = false,
								-- library = vim.api.nvim_get_runtime_file("", true),
								library = { vim.env.VIMRUNTIME },
							},
							diagnostics = { disable = { "missing-fields" } },
						})
						client.server_capabilities.semanticTokensProvider = nil
					end,
					settings = {
						Lua = {},
					},
				},
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		optional = true,
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = vim.list_extend(opts.sources or {}, {
				nls.builtins.formatting.stylua,
			})
		end,
	},
}
