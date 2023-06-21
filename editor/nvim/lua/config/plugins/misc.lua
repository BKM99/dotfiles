return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				use_diagnostic_signs = true,
				icons = false,
			})
		end,
		keys = {
			{ "<leader>m", ":TroubleToggle<cr>", desc = "Toggle Trouble" },
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
		"NMAC427/guess-indent.nvim",
		config = function()
			require("guess-indent").setup({
				auto_cmd = true,
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		-- stylua: ignore
		keys = {
			{ "<leader>a",  function() require("harpoon.mark").add_file() end,        desc = "Harpoon add file", },
			{ "<leader>1",  function() require("harpoon.ui").nav_file(1) end,         desc = "Harpoon nav file 1", },
			{ "<leader>2",  function() require("harpoon.ui").nav_file(2) end,         desc = "Harpoon nav file 2", },
			{ "<leader>3",  function() require("harpoon.ui").nav_file(3) end,         desc = "Harpoon nav file 3", },
			{ "<leader>4",  function() require("harpoon.ui").nav_file(4) end,         desc = "Harpoon nav file 4", },
			{ "<leader>5",  function() require("harpoon.ui").nav_file(5) end,         desc = "Harpoon nav file 5", },
			{ "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon toggle quick menu" },
		},
	},
}
