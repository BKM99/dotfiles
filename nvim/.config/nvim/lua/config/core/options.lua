vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.opt.guicursor = ""
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
vim.opt.termguicolors = true
vim.opt.path = "**"
vim.opt.wildignorecase = true
-- vim.opt.wildignore:append(
--     "*.png,*.jpg,*.jpeg,*.gif,*.wav,*.aiff,*.dll,*.pdb,*.mdb,*.so,*.swp,*.zip,*.gz,*.bz2,*.meta,*.svg,*.cache,*/.git/*"
-- )
-- vim.o.wildmenu = true
-- vim.o.wildmode = "longest,list,full"

if vim.fn.has("nvim-0.10") == 1 then
	vim.opt.smoothscroll = true
end

-- use system clipboard
local has = vim.fn.has
local is_mac = has("macunix")
local is_linux = has("unix")
local is_win = has("win32")
local is_wsl = has("wsl")

if is_mac == 1 then
	vim.opt.clipboard:append({ "unnamedplus" })
end
if is_linux == 1 then
	vim.opt.clipboard:append({ "unnamedplus" })
end
if is_win == 1 then
	vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })
end
if is_wsl == 1 then
	vim.cmd([[
		 augroup Yank
   		 autocmd!
   		 autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
   		 augroup END
	]])
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

if vim.fn.executable("rg") == 1 then
	vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
	vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
elseif vim.fn.executable("ag") == 1 then
	vim.o.grepprg = "ag --vimgrep"
	vim.o.grepformat = "%f:%l:%c:%m"
elseif vim.fn.executable("ack") == 1 then
	vim.o.grepprg = "ack --nogroup --nocolor"
elseif vim.fn.finddir(".git", ".;") ~= "" then
	vim.o.grepprg = "git --no-pager grep --no-color -n"
	vim.o.grepformat = "%f:%l:%m,%m %f match%ts,%f"
else
	vim.o.grepprg = "grep -nIR $* /dev/null"
end

-- some netrw stuff
-- vim.cmd[[
-- let g:netrw_liststyle = 3
-- let g:netrw_fastbrowse = 0
-- ]]
