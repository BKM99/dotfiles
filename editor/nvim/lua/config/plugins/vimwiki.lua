vim.cmd([[
let g:vimwiki_list = [{'path': '~/Documents/Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_table_mappings=0
let g:vimwiki_table_auto_fmt=0

" only use vimwiki in the vimwiki dir, not global
let g:vimwiki_global_ext = 0

augroup Mkd
au BufRead,BufWinEnter,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn} setlocal syntax=markdown
au BufRead,BufWinEnter,BufNewFile *.{md,mdx,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setlocal syntax=markdown
augroup END

]])
