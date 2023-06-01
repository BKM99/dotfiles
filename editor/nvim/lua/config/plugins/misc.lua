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
}
