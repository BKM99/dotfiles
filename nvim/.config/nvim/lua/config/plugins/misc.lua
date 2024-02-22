return {
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"numToStr/Comment.nvim",
		opts = {
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
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
		opts = {},
		config = function(_, opts)
			require("gitsigns").setup(opts)
			vim.keymap.set("n", "<leader>bl", ":Gitsigns blame_line<CR>", { desc = "Git blame line" })
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			-- use_default_keymaps = true,
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
		-- on macos might need to install gnu-sed
		"nvim-pack/nvim-spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "[S]earch and [R]eplace (Spectre)",
			},
		},
	},
}
