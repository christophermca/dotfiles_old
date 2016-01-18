"author: Christopher MCA
" Version: 1.0
" Sections:
"
"  Colors & Fonts
"  General
"  VIM UI
"       - GUI Options
"       - Window Options
"       - STATUS bar + COMMAN LINE
"        COLUMN RULE
"        LINE NUMBER
"       - MOUSE
"       - KEYBOARD
"       - SPLIT CONTROLS
"       - SEARCHING
"       - FOLDING
"  Plugins
"       - Pathogen
"=============================================================================
source ~/.vundle

" compatibility
set nocp

"=====================================================================
" COLORS AND FONTS
"=====================================================================
set t_Co=260
set background=dark
colorscheme meta5
"set clipboard=unnamed

" chose font by gui
if has("gui_running")
   if has("gui_gtk2")
      set guifont=Inconsolata\ 12
   elseif has("gui_macvim")
      set guifont=Menlo\ Regular:h12
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
let g:vim_json_syntax_conceal=0
set shortmess+=I
set tw=80
set formatoptions=tcq
set sua=".coffee,.js,.styl"

filetype plugin indent on
set autoindent
syntax enable "enable syntax processing

"when saving vimrc reload the source
"autocmd! bufwritepost .vimrc source %

au BufRead,BufNewFile *.cson set ft=coffee
au BufRead,BufNewFile *.json set filetype=json

"fix slow escape in iterm2
set ttimeout
set notimeout
set ttimeoutlen=20

"=====================================================================
" VIM UI
"=====================================================================
" Error notification
set vb " set error flashing
set noerrorbells " no beeping

set splitbelow
set splitright

" Don't create backups
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

set cursorline
set lazyredraw " redraw only when we need to
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
set ttyscroll=3 " workaround for gvim screen redraw issues
au FocusGained,BufEnter * :silent! checktime

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
" SPACES & TABS
" ****************
set tabstop=3 " number of visual spaces per tab
set shiftwidth=3
set softtabstop=3   " number of spaces in tab when editing
set expandtab " tabs are spaces

"show hidden chars
set list
set listchars=tab:»¬,trail:·

" ****************
" WINDOW size
" ****************
if has("gui_running")
   " GUI is running or is about to start.
   set lines=999 columns=999
endif

" for windows - sets the window to max size
if has("gui_running")
   if has("gui_win32")
      au GUIEnter * simalt ~x
   endif
endif

" ****************
" STATUS BAR + COMMAND LINE
" ****************
set showcmd " show command line in bottom bar
set wildmenu  " visual autocomplete for command menu

highlight Visual guibg=#333345

if has('statusline')
   set laststatus=2
   set statusline+=%{fugitive#statusline()} " git status (courtesy of fugitive)

   " Broken down into easily includeable segments
   set statusline=%f%<\                       " Filename
   set statusline+=[%{&ff}/%Y]\               " Filetype
   set statusline+=\[%{getcwd()}]%=           " Current dir
   set statusline+=%w%h%m%r\                  " Options
   set statusline+=%<%-14(%l,%c%V%)\ %p%%      " Right aligned file nav info ruler
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
set smartcase
set incsearch " search as characters are entered
set hlsearch " highlight matches

" ****************
" FOLDING
" ****************
set foldenable " enable folding
set foldlevel=0
set foldlevelstart=10 " open mast folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

" ****************
" KEYBOARD
" ****************
   " ____Leader mappings
   "Leader
   nnoremap <Space> <Nop>
   map <Space> \

   "___GENERAL
   set backspace=indent,eol,start

   " ____Resizing
   nmap <tab>h :vert res -10<CR>
   nmap <tab>l :vert res +10<CR>
   nmap <tab>k :resize +10<CR>
   nmap <tab>j :resize -10<CR>


   "Tab shortcuts
      "new
      nmap<Leader>t :tabnew<CR>

      "close tab
      nmap<Leader>xt :tabc<CR>

   "increment/decrement
   nmap <Leader>a <c-a>
   nmap <Leader>x <c-x>

   "view and select buffers
   nnoremap <Leader>l :ls<CR>:b<space>

   "quick change directory
   "nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

   "JSON prettyify and validate
   map <Leader>jn :%!python3 -m json.tool<CR>

   map <Leader>de :'<,'>!python -m base64 -d<CR>

   " searching
   nnoremap \<Leader> :nohlsearch<CR>

      " ****************
      " OS copy/paste
      " ****************

      "copy/paste to system clipboard
      vmap <Leader>y "+y
      vmap <Leader>yy "+yy
      vmap <Leader>Y "+Y
      vmap <Leader>yw "+yw
      vmap <Leader>yb "+yb
      vmap <Leader>D "+D
      vmap <Leader>p "+p
      vmap <Leader>P "+P

      nmap <Leader>y "+y<cr>
      nmap <Leader>yy "+yy<cr>
      nmap <Leader>Y "+Y<cr>
      nmap <Leader>yw "+yw<cr>
      nmap <Leader>yb "+yb<cr>
      nmap <Leader>D "+D<cr>
      nmap <Leader>p "+p<cr>
      nmap <Leader>P "+P<cr>

      "AG - the silver searcher
      map <Leader>ag :Ag<Space>

      "save
      map <Leader>w :w<CR>

      "save+ reload vimrc
      map <Leader>ws :w<CR> :so $MYVIMRC<CR>

      "vimrc
      nmap <Leader>vr :vsplit $MYVIMRC<CR>

   " Coffee
      " Compile
      nmap <Leader>cc :CoffeeCompile<CR>

   " ____SPLIT CONTROLS
   nmap <C-h> <C-w>h
   nmap <C-l> <C-w>l
   nmap <C-k> <C-w>k
   nmap <C-j> <C-w>j

   " ____Project tray
      "map -  :NERDTreeToggle<CR>
      "map -  :Explore <CR>

   " CTRL P
   let g:ctrlp_map = '<c-p>'
   let g:ctrlp_cmd = 'CtrlP ./'
   let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']



   " NETRW
   "let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
   "let g:netrw_preview   = 1
   "let g:netrw_liststyle = 3
   "let g:netrw_banner=0
   "let g:netrw_localrmdir='rm -r'
   "set autochdir


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

   "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&
      "b:NERDTreeType == \"primary") | q | endif

"=====================================================================
" MCA-HOMEGROWN
"=====================================================================
function! MultiChange(toinput)
   let fromselectedinput = @/
   substitute(%, l:fromselectedinput, a:toinput, "g")
endfunction
