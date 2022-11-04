local ok, project = pcall(require, "project_nvim")
if not ok then
	return
end

local ok2, telescope = pcall(require, "telescope")
if not ok2 then
	return
end

telescope.load_extension("projects")

project.setup({})
