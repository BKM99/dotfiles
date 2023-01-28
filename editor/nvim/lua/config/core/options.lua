-- vim.opt.guicursor = "" -- cursor is always a block
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.swapfile = false
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.hidden = true
vim.opt.lazyredraw = true
vim.opt.timeoutlen = 200
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.shortmess:append("c")
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Some default color stuff
vim.opt.termguicolors = true
vim.cmd([[syntax on]])
vim.opt.background = "dark"

-- https://neovim.io/doc/user/provider.html
-- on apple silicon only python 3.9.1 or higher works
-- vim.g.python3_host_prog = "~/.pyenv/versions/py3nvim/bin/python"
-- vim.g.node_host_prog = "/usr/local/bin/neovim-node-host"
-- vim.g.node_host_prog = "/opt/homebrew/bin/neovim-node-host"

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
