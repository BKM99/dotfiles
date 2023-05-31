vim.g.mapleader = " "

vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.timeoutlen = 300
vim.opt.cursorline = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.termguicolors = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- use system clipboard
if vim.fn.has("macunix") then
	vim.opt.clipboard:append({ "unnamedplus" })
elseif vim.fn.has("win32") then
	vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
elseif vim.fn.has("wsl") then
	vim.cmd([[
        augroup Yank
	    autocmd!
		autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
		augroup END
    ]])
end
