"author: Christopher MCA
" Version: 1.0
" Sections:
" // mapped key -> section
" // -subsection
"
"  c -> Colors & Fonts
"  g -> General
"  u -> VIM UI
"       - GUI Options
"       - Window Options
"       - STATUS ba + COMMAN LIN
"        COLUMN RULE
"        LINE NUMBER
"   -> MIS
"       - MOUSE
"       - KEYBOARD
"       - SPLIT CONTROLS
"       - SEARCHING
"       - FOLDING
"  p -> Plugins
"       - Pathogen
"=============================================================================
source ~/.vundle

" compatibility
set nocp

"=====================================================================
" set colors and fonts
"=====================================================================
set t_Co=256
set background=dark
colorscheme meta5

" chose font by gui
if has("gui_running")
   if has("gui_gtk2")
      set guifont=Inconsolata\ 12
   elseif has("gui_macvim")
      set guifont=Menlo\ Regular:h14
   elseif has("gui_win32")
      set guifont=Consolas:h10:w4:cANSI
   endif
endif
"=====================================================================
" GENERAL
"=====================================================================
cd ~/Repos

set ff=unix
set encoding=utf-8
let g:vim_json_syntax_conceal = 0
set autoread
set clipboard=unnamed
set shortmess+=I

filetype plugin indent on
syntax enable "enable syntax processing

"when saving vimrc reload the source
autocmd! bufwritepost .vimrc source %

au BufRead,BufNewFile *.cson set ft=coffee
au BufRead,BufNewFile *.json set filetype=json

"fix slow escape in iterm2
set ttimeout
set notimeout
set ttimeoutlen=20

" ****************
" SPACES & TABS
" ****************
set tabstop=3 " number of visual spaces per tab
set shiftwidth=3
set softtabstop=3   " number of spaces in tab when editing
set expandtab " tabs are spaces

"show hidden chars
set list
set listchars=tab:»¬,trail:·

"=====================================================================
" VIM UI
"=====================================================================
set vb " set error flashing
set noerrorbells " no beeping
set splitbelow
set splitright
set cursorline
set lazyredraw " redraw only when we need to
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore " Allow for cursor beyond last character
set history=1000 " Store a ton of history (default is 20)
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
" WINDOW size
" ****************
if has("gui_running")
   " GUI is running or is about to start.
   set lines=999 columns=999
endif

" for windows - sets the window to max size
au GUIEnter * simalt ~x

" ****************
" STATUS bar + COMMAND LINE
" ****************

set showcmd " show command line in bottom bar
set noruler " Hide the ruler
set wildmenu  " visual autocomplete for command menu

highlight Visual guibg=#333345

if has('statusline')
   set laststatus=2
   set statusline+=%{fugitive#statusline()} " git status (courtesy of fugitive)
   " Broken down into easily includeable segments
   set statusline=%<%f\                     " Filename
   set statusline+=%w%h%m%r                 " Options
   set statusline+=\ [%{&ff}/%Y]            " Filetype
   set statusline+=\ [%{getcwd()}]          " Current dir
   set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

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
" MOUSE
" ****************
set mouse=a " Automatically enable mouse usage
set mousehide  " Hide the mouse cursor while typing

" ****************
" SEARCHING
" ****************
set ic "ignorecase
set incsearch " search as characters are entered
set hlsearch " highlight matches

" ****************
" FOLDING
" ****************
set foldenable " enable folding
set foldlevelstart=10 " open mast folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

" ****************
" KEYBOARD
" ****************
set backspace=indent,eol,start

" ****************
" KEY MAPPINGS
" ****************

   " ****************
   " GENERAL
   " ****************

   "Resizing
   nmap <tab>h :vert res -10<CR>
   nmap <tab>l :vert res +10<CR>
   nmap <tab>k :resize +10<CR>
   nmap <tab>j :resize -10<CR>

   " ****************
   " SEARCHING
   " ****************
   nnoremap <leader><space> :nohlsearch<CR>

   " ****************
   " KEYBOARD
   " ****************
   map  <C-n><C-t> :tabnew<CR> "new tab
   map  <C-n> <C-w> :enew<CR> "new window
   nnoremap  <leader>s :w<CR>
   nnoremap <leader>vr :vsplit $MYVIMRC<CR>

   " ****************
   " SPLIT CONTROLS
   " ****************
   nmap <C-h> <C-w>h
   nmap <C-l> <C-w>l
   nmap <C-k> <C-w>k
   nmap <C-j> <C-w>j

   " ****************
   " NERDTREE
   " ****************
   map <leader><tab>  :NERDTreeToggle<CR>
   "map <leader><tab>  :Lexplore<CR>

   " ****************
   " CTRL P
   " ****************
   let g:ctrlp_map = '<c-p>'
   let g:ctrlp_cmd = 'CtrlP ./'
   let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"=====================================================================
" PlUGINS
"=====================================================================

" CTRL P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" NERD TREE
"Open NERDTree at startup
"   autocmd vimenter * NERDTree

"Open NERDTree at if vim start with empth buffer
"  autocmd StdinReadPre * let s:std_in=1
"  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"If NERDtree is the only buffer left open and you quit vim. Vim will close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
