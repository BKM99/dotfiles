return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				use_diagnostic_signs = true,
				icons = false,
			})
			vim.keymap.set("n", "<leader>m", "<cmd>TroubleToggle<cr>")
		end,
	},
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").open()<CR>', {
				desc = "Open Spectre",
			})
			vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
				desc = "Search current word",
			})
			vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
				desc = "Search current word",
			})
			vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=false})<CR>', {
				desc = "Search on current file",
			})
		end,
		-- keys = {
		-- 	{
		-- 		"<leader>s",
		-- 		function()
		-- 			require("spectre").open()
		-- 		end,
		-- 		desc = "Replace in files (Spectre)",
		-- 	},
		-- },
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
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({})
		end,
	},
}
