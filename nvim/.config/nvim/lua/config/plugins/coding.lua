local icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}

return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
				build = (function()
					if vim.fn.has("win32") == 1 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			local MAX_INDEX_FILE_SIZE = 4000

			-- enable html snipperts in jsx, tsx, js
			luasnip.filetype_extend("javascript", { "html" })
			luasnip.filetype_extend("javascriptreact", { "html" })
			luasnip.filetype_extend("typescriptreact", { "html" })

			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = {
					completeopt = "menu,menuone,noinsert,noselect",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = function(entry, vim_item)
						vim_item.kind = (icons[vim_item.kind] or "Foo") .. "\t" .. vim_item.kind
						-- vim_item.menu = ({
						-- 	nvim_lsp = "[LSP]",
						-- 	nvim_lua = "[Lua]",
						-- 	luasnip = "[Snippet]",
						-- 	buffer = "[Buffer]",
						-- 	path = "[Path]",
						-- 	emoji = "[Emoji]",
						-- })[entry.source.name]
						return vim_item
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{
						name = "buffer",
						keyword_length = 4,
						options = {
							get_bufnrs = function()
								local bufs = {}
								for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
									-- Don't index giant files
									if
										vim.api.nvim_buf_is_loaded(bufnr)
										and vim.api.nvim_buf_line_count(bufnr) < MAX_INDEX_FILE_SIZE
									then
										table.insert(bufs, bufnr)
									end
								end
								return bufs
							end,
						},
					},
				},
			})
		end,
	},
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		opts = function(_, opts)
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			opts.ignore = "^$"
			opts.pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			opts.root_dir = opts.root_dir or require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git")
			opts.sources = vim.list_extend(opts.sources or {}, {})
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			opts.on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function(c)
							vim.lsp.buf.format({
								async = false,
								filter = function(c)
									return c.name == "null-ls"
								end,
							})
						end,
					})
				end
			end
		end,
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
	{ "tpope/vim-surround" },
	{ "wellle/targets.vim" },
}
