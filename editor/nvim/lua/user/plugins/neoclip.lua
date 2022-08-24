local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
	return
end

neoclip.setup()

telescope.load_extension("neoclip")
