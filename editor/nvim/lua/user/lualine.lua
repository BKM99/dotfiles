local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local branch = {
    "branch",
    icons_enabled = false,
    icon = "",
}

lualine.setup {
    options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = { left = "|", right = "|"},
        section_separators = { left = "", right = ""},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {branch},
        lualine_c = {"filename", "lsp_progress"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
