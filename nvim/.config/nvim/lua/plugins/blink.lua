return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},
		opts = {
			keymap = {
				preset = "super-tab",
			},
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
		config = function(_, opts)
			local blink = require("blink.cmp")

			blink.setup(opts)
			vim.lsp.config("*", { capabilities = blink.get_lsp_capabilities(nil, true) })
		end,
	},
}
