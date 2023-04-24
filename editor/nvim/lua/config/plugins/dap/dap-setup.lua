local dap = require("dap")
local dapui = require("dapui")
require("nvim-dap-virtual-text").setup({})

dapui.setup({})

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local load_launchjs = function()
	require("dap.ext.vscode").load_launchjs()
end

if not pcall(load_launchjs) then
	print("Failed to parse launch.json.")
end
