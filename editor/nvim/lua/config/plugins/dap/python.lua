local dap_python_status_ok, dap_python = pcall(require, "dap-python")
if dap_python_status_ok then
	dap_python.setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
end
