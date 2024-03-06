return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local keymap = vim.keymap.set

			vim.fn.sign_define("DapBreakpoint", { text = "•", texthl = "DiagnosticError", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "?", texthl = "DiagnosticError", linehl = "", numhl = "" }
			)
			vim.fn.sign_define("DapLogPoint", { text = "⁋", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = " ", texthl = "DiagnosticInfo", linehl = "", numhl = "" })

			keymap("n", "<S-down>", dap.continue, { desc = "Debug: Start/Continue" })
			keymap("n", "<S-right>", dap.step_into, { desc = "Debug: Step Into" })
			keymap("n", "<S-up>", dap.step_over, { desc = "Debug: Step Over" })
			keymap("n", "<S-left>", dap.step_out, { desc = "Debug: Step Out" })
			keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			keymap("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })
			keymap("n", "<leader>du", dapui.toggle, { desc = "Debug: See last session result." })

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close
		end,
	},
}
