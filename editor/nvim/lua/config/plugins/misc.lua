return {
	{
		"echasnovski/mini.comment",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
			local ok, cmp = pcall(require, "cmp")
			if ok then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap.set

			keymap("n", "]h", ":Gitsigns next_hunk<CR>", opts)
			keymap("n", "[h", ":Gitsigns prev_hunk<CR>", opts)
			keymap("n", "<leader>bl", ":Gitsigns blame_line<CR>", opts)
			keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", opts)
			keymap({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", opts)
			keymap("n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", opts)
			keymap("n", "<leader>ghd", ":Gitsigns diffthis<CR>", opts)

			gitsigns.setup()
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		cmd = "VenvSelect",
		opts = {
			name = {
				"venv",
				".venv",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			view_options = {
				show_hidden = true,
			},
		},
		config = function(_, opts)
			require("oil").setup(opts)
			vim.keymap.set("n", "<leader>t", "<CMD>Oil<CR>", { desc = "Open parent directory (Oil)" })
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("spectre").setup()
			vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
				desc = "Toggle Spectre",
			})
			vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
				desc = "Search current word",
			})
			vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
				desc = "Search current word",
			})
			vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
				desc = "Search on current file",
			})
		end,
	},
}
