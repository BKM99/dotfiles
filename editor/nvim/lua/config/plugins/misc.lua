return {
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
	},
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
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local trouble = require("trouble")
			local opts = { noremap = true, silent = true }
			local keymap = vim.keymap.set

			keymap("n", "<leader>m", ":TroubleToggle<CR>", opts)

			trouble.setup({
				use_diagnostic_signs = true,
			})
		end,
	},
	{ "andymass/vim-matchup", event = "BufReadPost" },
	{ "tpope/vim-sleuth", cmd = { "Sleuth" } },
}
