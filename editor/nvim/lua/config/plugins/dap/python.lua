local dap_python_status_ok, dap_python = pcall(require, "dap-python")
if not dap_python_status_ok then
	return
end

dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python", {})
