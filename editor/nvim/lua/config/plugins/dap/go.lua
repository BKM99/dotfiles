local ok, dap_go = pcall(require, "dap-go")
if ok then
	dap_go.setup({
		delve = {
			path = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/dlv"
		},
	})
end
