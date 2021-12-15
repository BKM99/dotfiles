" MANAGING PLUGINS WITH VIM-PLUG
" ==================================================================================
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

" Must Have PLugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-fugitive'

" Language Support
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

" Other
call plug#end()
" ==================================================================================

" KEY BINDS
let mapleader="\<Space>"       " leader is space
nmap <leader>w :w<CR>

"fzf key remap
map <leader>f :Files<CR>
nmap <leader>; :Buffers<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" keybind to open NERDTree
nnoremap <leader>t :NERDTreeToggle<Enter>

" Use Control-c to copy to system clipboard
vnoremap <C-c> "*y :let @+=@*<CR>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
" ==================================================================================

" Linter Stuff
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black','isort']
\}

let g:ale_fix_on_save = 1
let python_highlight_all=1

" lightline layout
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" fzf laylout
let g:fzf_layout = { 'down': '~30%' }

" NERDTree Settings
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" closes NERDTree if it is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python
set autoindent

" Color/Theme setup
colorscheme gruvbox
set background=dark
syntax on
set termguicolors

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

set backspace=indent,eol,start     " Make backspace behave in a more intuitive way
set noswapfile
set encoding=utf-8
set number              " show line numbers
set mouse=a             " A necessary evil, mouse support
set nowrap              " text is not wrapped
set noshowmode
set scrolloff=6
set hidden
set lazyredraw
set timeoutlen=300
