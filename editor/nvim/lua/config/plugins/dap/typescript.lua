-- TODO: stil needs work, also make ts-node work for debugging
local dap = require("dap")

require("dap-vscode-js").setup({
	node_path = "node",
	debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
	debugger_cmd = { "js-debug-adapter" },
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

for _, lang in ipairs({ "typescript", "javascript" }) do
	dap.configurations[lang] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch Current File (pwa-node with ts-node)",
			cwd = vim.fn.getcwd(),
			runtimeArgs = { "--loader", "ts-node/esm" },
			runtimeExecutable = "node",
			args = { "${file}" },
			sourceMaps = true,
			protocol = "inspector",
			skipFiles = { "<node_internals>/**", "node_modules/**" },
			resolveSourceMapLocations = {
				"${workspaceFolder}/**",
				"!**/node_modules/**",
			},
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			skipFiles = { "<node_internals>/**" },
			protocol = "inspector",
			console = "integratedTerminal",
			sourceMaps = true,
			resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js" },
			runtimeExecutable = "ts-node",
		},
	}
end

for _, lang in ipairs({ "typescriptreact", "javascriptreact" }) do
	dap.configurations[lang] = {
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-chrome",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
	}
end
