" Theme related data
" author : Damien Riquet
" mail   : d.riquet@gmail.com
" github : driquet


" Colorscheme
set background=dark
colorscheme molokai
set tabpagemax=15

" UI
set tabpagemax=15
set showmode
set cursorline

" GUI settings
if has('gui_running')
    set guioptions-=T           " Remove the toolbar
    set guioptions-=L
    set guioptions-=R
    set lines=40                " 40 lines of text instead of 24,
    if has("gui_gtk2")
        set guifont=Inconsolata\ 16,Andale\ Mono\ Regular\ 14,Menlo\ Regular\ 14,Consolas\ Regular\ 14,Courier\ New\ Regular\ 18
        set guifont=Source\ Code\ Pro\ for\ Powerline "make sure to escape the spaces in the name properly
    else
        set guifont=Inconsolata\ for\ Powerline\ 16,Inconsolata\ 16,Andale\ Mono\ Regular:h14,Menlo\ Regular:h14,Consolas\ Regular:h14,Courier\ New\ Regular:h18
    endif
    if has('gui_macvim')
        set transparency=0          " Make the window slightly transparent
    endif
    else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
     endif
endif

set guifont=Inconsolata\ for\ Powerline\ 16

