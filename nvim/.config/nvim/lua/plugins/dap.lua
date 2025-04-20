return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
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

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			dap.adapters.go = {
				type = "executable",
				command = "node",
				args = { os.getenv("HOME") .. "/dev/golang/vscode-go/extension/dist/debugAdapter.js" },
			}
			dap.configurations.go = {
				{
					type = "go",
					name = "Debug",
					request = "launch",
					showLog = false,
					program = "${file}",
					dlvToolPath = vim.fn.exepath("dlv"),
				},
			}
		end,
	},
}
