local ok, dap_go = pcall(require, "dap-go")
if ok then
	dap_go.setup({
		delve = {
			path = vim.fn.stdpath("data") .. "/mason/bin/dlv"
		},
	})
end
