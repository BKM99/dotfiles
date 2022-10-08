local dap_python_status_ok, dap_python = pcall(require, "dap-python")
if not dap_python_status_ok then
	return
end

-- create a virtual environment and install debugpy
-- Note: the virutal environment does not need to be active, just point to the install location
-- I liked having one python virtual environment specifically for Neovim
dap_python.setup("~/.pyenv/versions/py3nvim/bin/python", {})
