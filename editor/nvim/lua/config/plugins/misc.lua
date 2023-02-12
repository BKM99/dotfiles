return {
	{
		"windwp/nvim-autopairs",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if cmp_status_ok then
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},
	{
		"airblade/vim-rooter",
		config = function()
			vim.cmd([[ let g:rooter_silent_chdir = 1 ]])
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = { "markdown" },
		cmd = "MarkdownPreview",
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>S",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local trouble = require("trouble")
			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap.set

			keymap("n", "<leader>e", ":TroubleToggle<CR>", opts)

			trouble.setup({
				use_diagnostic_signs = true,
			})
		end,
	},
	{
		"mbbill/undotree",
		keys = { { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "UndoTreeToggle" } },
		config = function()
			vim.g.undotree_SetFocusWhenToggle = 1
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = { { "<leader>t", "<cmd>NeoTreeRevealToggle<cr>", desc = "NeoTree Toggle" } },
		config = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = true,
						hide_by_name = { "node_modules" },
						follow_current_file = true,
					},
				},
			})
		end,
	},
	{
		"/gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 100,
				},
			})
			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
			vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
			vim.keymap.set("n", "<leader>yh", "<cmd>Telescope yank_history<cr>")
		end,
	},

	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		config = true,
        -- stylua: ignore
        -- TODO: fix the keymaps for this
        keys = {
            { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
            { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
            { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
            { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
        },
	},

	{ "andymass/vim-matchup" },
}
