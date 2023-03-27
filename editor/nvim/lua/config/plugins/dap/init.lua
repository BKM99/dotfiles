return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
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
