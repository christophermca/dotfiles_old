set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


"============================================================================
" Author: Christopher MCA
" Version: 1.0 09/12/14 09:04
"
" Sections: 
"   -> Colors & Fonts
"   -> General
"   -> VIM UI
"       GUI Options
"       Window Options
"       STATUS bar + COMMAND LINE
"       COLUMN RULER
"       LINE NUMBERS
"       MISC
"        MOUSE
"        KEYBOARD
"        SPLIT CONTROLS
"        SEARCHING
"        FOLDING
"   -> Plugins
"       Pathogen
"=======:=====================================================================

" INSTALL PATHOGEN
execute pathogen#infect()

"=====================================================================
" SET COLORS and Fonts
"=====================================================================
    colorscheme jellybeans
    set background=dark
    set guifont=Lucida_Console:h10:cDEFAULT

"=====================================================================
" GENERAL 
"=====================================================================

set ff=dos
scriptencoding utf-8
set encoding=utf-8
syntax enable " enable syntax processing
cd c:/localdev/m " home diretory
set shortmess+=I

" **************** 
" SPACES & TABS
" **************** 
    set tabstop=4 " number of visual spaces per tab
    set shiftwidth=4
    set softtabstop=4   " number of spaces in tab when editing
    set expandtab " tabs are spaces
    set listchars=tab:>-,trail:_,nbsp:.
    set list
"=====================================================================
"VIM UI 
"=====================================================================
set vb " set error flashing
set noerrorbells " no beeping

" **************** 
" go: GUI OPTIONS
" +: show
" -: hide
" **************** 
    set go-=T " toolbar
    set go-=m " menu 
    set go-=l " hide left sroll bar
    set go-=L " hide left scroll bar in split
    set go-=R " hide right scroll bar
    set go-=r " hide right scroll bar in split

" **************** 
" WINDOW options
" **************** 
set lines=50 columns=120 " window initSize
au GUIEnter * simalt ~x

" **************** 
" STATUS bar + COMMAND LINE
" **************** 
    set cursorline  
        highlight CursorLine guibg=gray17
        highlight Visual guibg=#333345
    filetype indent on "load filetype-specific indent files
    set wildmenu  " visual autocomplete for command menu

if has('statusline')
    set laststatus=2
    set statusline+=%{fugitive#statusline()}  
    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif
set showcmd " show command line in bottom bar
set noruler " Show the ruler
   
" **************** 
" COLUMN RULER
" **************** 
    "set colorcolumn=120
    " To tone down the coloring 
    " highlight ColorColumn  guibg=Gray12
    
" **************** 
"LINE NUMBERS
" **************** 
    set number " show line numbers
    set nuw=5 " number width to 6 makes things look a little neater

" **************** 
"MISC
" **************** 
    set lazyredraw " redraw only when we need to
    "set showmatch " highlight matching [{()}]
    set nobackup       "no backup files
    set nowritebackup  "only in case you don't want a backup file while editing
    set noswapfile     "no swap files
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore " Allow for cursor beyond last character
    set history=1000 " Store a ton of history (default is 20)
    "set spell " Spell checking on
    set hidden " Allow buffer switching without saving
    set confirm " confirm if you want to save
    set tabpagemax=15 " Only show 15 page tabs 
    set showmode " Display the current mode
    set linespace=0 " No extra spaces between rows
    set nowrap " Do not wrap long lines
    set scrolloff=3 " Minimum lines to keep above and below cursor
    " workaround for gvim screen redraw issues
    set ttyscroll=3

" **************** 
" MOUSE
" **************** 
    set mouse=a " Automatically enable mouse usage
    set mousehide  " Hide the mouse cursor while typing

" **************** 
" KEYBOARD
" **************** 
    set backspace=indent,eol,start
    " TABS
    map  tn :tabn<CR> "next tab
    map  tp :tabp<CR> "previous tab
    map  <C-n> <C-t> :tabnew<CR> "new tab
    map  <C-n> <C-w> :enew<CR> "new window
    map  <C-s> :w<CR> 
" **************** 
" SPLIT CONTROLS
" **************** 
    nmap <C-h> <C-w>h
    nmap <C-l> <C-w>l
    nmap <C-k> <C-w>k
    nmap <C-j> <C-w>j
" **************** 
" SEARCHING
" **************** 
    set ic "ignorecase
    set incsearch " search as characters are entered
    set hlsearch " highlight matches
    " turn off search highlight
    nnoremap <leader><space> :nohlsearch<CR>

" **************** 
" FOLDING
" **************** 
    set foldenable " enable folding
    set foldlevelstart=10 " open mast folds by default
    set foldnestmax=10 " 10 nested fold max
    set foldmethod=indent " fold based on indent level

"=====================================================================
" PlUGINS
"=====================================================================
" NERD TREE
autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <F5> :NERDTreeToggle<CR>



