set timeoutlen=1000 ttimeoutlen=0 " pressing esc takes too long
set nocompatible              " be iMproved, required
filetype off                  " required

" ============================================================================================================
" Start of Vundle Stuff

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let s:bootstrap = 0
try
        call vundle#begin()
catch /E117:/
        let s:bootstrap = 1
        silent !mkdir -p ~/.vim/bundle
        silent !unset GIT_DIR && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        redraw!
        call vundle#begin()
endtry
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Must have plugins
Plugin 'scrooloose/nerdtree'
Plugin 'machakann/vim-highlightedyank'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'

" Themes
Plugin 'kaicataldo/material.vim'
Plugin 'bluz71/vim-nightfly-guicolors'
Plugin 'chriskempson/base16-vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'itchyny/lightline.vim'
Plugin 'sainnhe/sonokai'
Plugin 'morhetz/gruvbox'

" Language/Syntax Stuff
Plugin 'rust-lang/rust.vim'
Plugin 'dense-analysis/ale'
Plugin 'pangloss/vim-javascript'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'jiangmiao/auto-pairs'

" Other
Plugin 'frazrepo/vim-rainbow'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-rooter'


" All of your Plugins must be added before the following line
call vundle#end()            " required
if s:bootstrap
        silent PluginInstall
        silent PluginUpdate
        silent PluginClean
        quit
end
filetype plugin indent on    " required
" End of Vundle Stuff
" ============================================================================================================

" lightline layout
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" fzf laylout
let g:fzf_layout = { 'down': '~20%' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" NERDTree Settings
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" closes NERDTree if it is the only buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
" Spaces & Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Insert 4 spaces on a tab
set expandtab       " tabs are spaces, mainly because of python
set autoindent

" UI Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
colorscheme gruvbox
syntax enable           " enable syntax processing
set scrolloff=6
set background=dark
set number              " show line numbers
set mouse+=a            " A necessary evil, mouse support
set nowrap              " text is not wrapped
set noshowmode
set laststatus=2
set noshowcmd           " to get rid of display of last command
set shortmess+=F        " to get rid of the file name displayed in the command line bar

" Sensible stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start     " Make backspace behave in a more intuitive way
set noswapfile
set encoding=utf-8
set fileformat=unix

"Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Ignore case in searches by default
set smartcase           " But make it case sensitive if an uppercase is entered

" Key Binds"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<Space>"       " leader is space
nmap <leader>w :w<CR>


" No arrow keys --- force yourself to use the home row
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"fzf key remap
map <leader>f :Files<CR>
nmap <leader>; :Buffers<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" keybind to open NERDTree
nnoremap <leader>t :NERDTreeToggle<Enter>

" control-c to copy, then use 'p' or whatever to paste
vnoremap <C-c> "*y :let @+=@*<CR>
