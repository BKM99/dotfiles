return {
	"mfussenegger/nvim-dap",

	config = function()
		require("config.plugins.dap.go")
		require("config.plugins.dap.python")
		require("config.plugins.dap.cpp")
	end,

	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			-- stylua: ignore
			keys = {
				{ "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
				{ "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
			},
			opts = {},
			config = function(_, opts)
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup(opts)
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close({})
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close({})
				end
			end,
		},

		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},

		{ "leoluz/nvim-dap-go" },
		{ "mfussenegger/nvim-dap-python" },
		-- {
		-- 	"jay-babu/mason-nvim-dap.nvim",
		-- 	config = function()
		-- 		require("mason-nvim-dap").setup({
		-- 			handlers = {
		-- 				function(config)
		-- 					require("mason-nvim-dap").default_setup(config)
		-- 				end,
		-- 			},
		-- 		})
		-- 	end,
		-- },
	},

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
		{ "<S-up>",     "<cmd>lua require'dap'.continue()<cr>",    desc = "DAP continue" },
		{ "<S-right>",  "<cmd>lua require'dap'.step_into()<cr>",   desc = "DAP step into" },
		{ "<S-left>",   "<cmd>lua require'dap'.step_over()<cr>",   desc = "DAP step over" },
		{ "<S-down>",   "<cmd>lua require'dap'.step_out()<cr>",    desc = "DAP step out" },
		{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "DAP REPL toggle" },
		{ "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>",    desc = "DAP run last" },
		{ "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>",   desc = "DAP terminate" },
	},
}
