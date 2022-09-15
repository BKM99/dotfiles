local status_ok, notify = pcall(require, "notify")
if not status_ok then
	return
end

notify.setup({
	stages = "fade_in_slide_out",
	render = "default",
	timeout = 250,
	minimum_width = 10,
    max_width = 50,
    max_height = 60,
    fps = 60,
    top_down = false,
})

vim.notify = notify
