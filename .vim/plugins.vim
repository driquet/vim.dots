" Plugins (through bundles)
" author : Damien Riquet
" mail   : d.riquet@gmail.com
" github : driquet


" Verify first if vundle is installed
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif


" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()


" Groups of bundles to install
if !exists('g:bundle_groups')
    let g:bundle_groups=['general', 'tool', 'completion', 'git', 'gist', 'colorscheme', 'orgmode', 'spell']
endif

Plugin 'gmarik/vundle'

" GENERAL
if count(g:bundle_groups, 'general')
    Plugin 'bling/vim-airline'
endif


" TOOL
if count(g:bundle_groups, 'tool')
    Plugin 'yegappan/mru'
    Plugin 'ervandew/supertab'
	Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
    Plugin 'junegunn/fzf.vim'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'vim-scripts/Gundo'
    Plugin 'godlygeek/tabular'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdtree'
    Plugin 'myusuf3/numbers.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'Raimondi/delimitMate'
    Plugin 'Yggdroot/indentLine'
    Plugin 'tpope/vim-commentary'
endif


if count(g:bundle_groups, 'orgmode')
    Plugin 'tpope/vim-speeddating'
    Plugin 'jceb/vim-orgmode'
endif

if count(g:bundle_groups, 'completion')
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'
    Plugin 'honza/vim-snippets'
endif

" GIT
if count(g:bundle_groups, 'git')
    Plugin 'tpope/vim-fugitive'
    Plugin 'gregsexton/gitv'
    Plugin 'airblade/vim-gitgutter'
endif

" GIST
if count(g:bundle_groups, 'gist')
    Plugin 'mattn/webapi-vim'
    Plugin 'mattn/gist-vim'
endif



" COLORSCHEME
if count(g:bundle_groups, 'colorscheme')
    Plugin 'flazz/vim-colorschemes'
endif

" SPELL
if count(g:bundle_groups, 'spell')
	Plugin 'vim-scripts/LanguageTool'
endif


" Auto install bundles if Vundle has just been installed
if iCanHazVundle == 0
    echo "Installing Plugins..."
    echo ""
    :PluginInstall
endif

call vundle#end()
