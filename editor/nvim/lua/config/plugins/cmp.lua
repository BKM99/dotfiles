return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				"rafamadriz/friendly-snippets",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- This is needed for this https://github.com/L3MON4D3/LuaSnip/issues/748
		vim.keymap.set("s", "p", function()
			vim.api.nvim_feedkeys("p", "n", false)
		end, { silent = true, remap = false, desc = "Don't paste in select mode (LuaSnip)" })

		vim.opt.completeopt = { "menu", "menuone", "noselect" }

		luasnip.config.set_config({
			region_check_events = "InsertEnter",
			delete_check_events = "InsertLeave",
		})

		local unlinkgrp = vim.api.nvim_create_augroup("UnlinkSnippetOnModeChange", { clear = true })

		vim.api.nvim_create_autocmd("ModeChanged", {
			group = unlinkgrp,
			pattern = { "s:n", "i:*" },
			desc = "Forget the current snippet when leaving the insert mode",
			callback = function(evt)
				if luasnip.session and luasnip.session.current_nodes[evt.buf] and not luasnip.session.jump_active then
					luasnip.unlink_current()
				end
			end,
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = {
				{ name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
			{
				{ name = "buffer", keyword_length = 5 },
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			window = {
				documentation = vim.tbl_deep_extend("force", cmp.config.window.bordered(), {
					max_height = 15,
					max_width = 60,
				}),
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		})

	end,
}
