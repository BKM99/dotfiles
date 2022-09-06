local status_ok, femaco = pcall(require, "femaco")
if not status_ok then
	return
end

femaco.setup({})
