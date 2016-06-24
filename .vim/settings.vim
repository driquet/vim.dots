" VIM Settings
" author : Damien Riquet
" mail   : d.riquet@gmail.com
" github : driquet

filetype plugin indent on " Automatically detect file types
syntax on " Syntax highlighting
set mouse=a " Enable mouse
set mousehide " Hide the cursor while typing

" Clipboard
set clipboard=unnamed

set autowrite " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
" set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" Formating
set nowrap                      " Wrap long lines
set noexpandtab
set autoindent                  " Indent at the same level of the previous line
set copyindent
set softtabstop=0               " Let backspace delete indent
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
"set matchpairs+=<:>             " Match, to be used with %
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

set backup                  " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>


" Directories (swap, backup and so on)
set backupdir=~/.vim/.backup
set directory=~/.vim/.swap
set undodir=~/.vim/.undo

" Ctags
set tags=tags;/
