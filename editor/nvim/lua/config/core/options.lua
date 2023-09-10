vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.wrap = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 10
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
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.path = "**"
vim.opt.wildignorecase = true

-- true color support
if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end

-- use system clipboard
local has = vim.fn.has
local is_mac = has "macunix"
local is_linux = has "unix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac == 1 then
	vim.opt.clipboard:append { 'unnamedplus' }
end
if is_linux == 1 then
	vim.opt.clipboard:append { 'unnamedplus' }
end
if is_win == 1 then
	vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
end
if is_wsl == 1 then
	vim.cmd [[
		 augroup Yank
   		 autocmd!
   		 autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
   		 augroup END
	]]
end
