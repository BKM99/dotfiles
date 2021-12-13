set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"=====================================
"These Settings only work in NeoVim
"=====================================
"Persistant undo
set undodir = ~/.vimUndoDir
set undofile
