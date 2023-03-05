-- Better Netrw
-- vim.g.netrw_banner = 0 -- Hide banner
-- vim.g.netrw_browse_split = 4 -- Open in previous window
-- vim.g.netrw_altv = 1 -- Open with right splitting
vim.g.netrw_liststyle = 3 -- Tree-style view
vim.g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 30
vim.g.netrw_localcopydircmd = "cp -r"

vim.keymap.set("n", "<leader>t", ":Explore %:p:h<cr>")

-- Turns off netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1
-- vim.g.loaded_netrwFileHandlers = 1
