local status_ok, mkdnflow = pcall(require, "mkdnflow")
if not status_ok then
	return
end

mkdnflow.setup({})
