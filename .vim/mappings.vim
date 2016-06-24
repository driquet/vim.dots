" Key mappings
" author : Damien Riquet
" mail   : d.riquet@gmail.com
" github : driquet

:command! W w " Write the file

" Yank from the cursor to the end of the line
nnoremap Y y$

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Search word under cursor by using Ag | <leader>a
noremap <silent><Leader>a :Ag <C-R>=expand("<cword>")<CR><CR>"}

noremap <Leader>oc :e %<.c<CR>
noremap <Leader>oh :e %<.h<CR>
