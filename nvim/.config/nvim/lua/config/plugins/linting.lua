return {
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, {
					-- linters
					"flake8",
					"shellcheck",
					-- "eslint_d",
				})
			end
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			require("lint").linters_by_ft = {
				python = { "flake8" },
				sh = { "shellcheck" },
				-- javascript = { "eslint_d" },
				-- typescript = { "eslint_d" },
				-- javascriptreact = { "eslint_d" },
				-- typescriptreact = { "eslint_d" },
			}

			vim.keymap.set("n", "<leader>ll", function()
				require("lint").try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
}
