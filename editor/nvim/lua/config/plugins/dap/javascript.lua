-- TODO: stil needs work, also make ts-node work for debugging
local dap = require("dap")

require("dap-vscode-js").setup({
	node_path = "node",
	debugger_path = os.getenv("HOME") .. "/.local/share/nvim/lazy/vscode-js-debug",
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

for _, lang in ipairs({ "typescript", "javascript" }) do
	dap.configurations[lang] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			skipFiles = { "<node_internals>/**" },
			protocol = "inspector",
			console = "integratedTerminal",
			sourceMaps = true,
			resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js" },
			runtimeExecutable = "ts-node",
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
