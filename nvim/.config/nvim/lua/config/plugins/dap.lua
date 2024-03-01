-- NOTE: not using dap for now
return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local keymap = vim.keymap.set

		keymap("n", "<F4>", dap.continue, { desc = "Debug: Start/Continue" })
		keymap("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
		keymap("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
		keymap("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
		keymap("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		keymap("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })
		keymap("n", "<leader>du", dapui.toggle, { desc = "Debug: See last session result." })

		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		require("dap-python").setup(
			require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
		)

		require("dap-go").setup({
			delve = {
				path = require("mason-registry").get_package("delve"):get_install_path() .. "/dlv",
			},
		})
	end,
}
