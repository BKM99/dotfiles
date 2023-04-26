-- TODO: still need to make DAP work better for typescript/javascript
return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>db",
				"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
				desc = "DAP set breakpoint",
			},
			{
				"<leader>dbc",
				":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
				desc = "DAP breakpoint condition",
			},
			{
				"<leader>dlp",
				":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
				desc = "DAP logpoint message",
			},
			{ "<S-up>", "<cmd>lua require'dap'.continue()<cr>", desc = "DAP continue" },
			{ "<S-right>", "<cmd>lua require'dap'.step_into()<cr>", desc = "DAP step into" },
			{ "<S-left>", "<cmd>lua require'dap'.step_over()<cr>", desc = "DAP step over" },
			{ "<S-down>", "<cmd>lua require'dap'.step_out()<cr>", desc = "DAP step out" },
			{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "DAP REPL toggle" },
			{ "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "DAP run last" },
			{ "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "DAP UI toggle" },
			{ "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", desc = "DAP terminate" },
		},
		config = function()
			require("config.plugins.dap.dap-setup")
			require("config.plugins.dap.go")
			require("config.plugins.dap.python")
			require("config.plugins.dap.javascript")
			require("config.plugins.dap.rust")
			require("config.plugins.dap.cpp")
		end,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
		},
	},
}
