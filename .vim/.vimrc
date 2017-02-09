" AUTHOR: Christopher MCA
" Version: 1.0
" Sections:
"
" Plugins
"=============================================================================
" Vim >= 7.0 specific colors
if !has('packages')
source ~/.vundle
endif

" compatibility

" SETUP {{{
"=====================================================================
" general {{{
set nocp
set fileformat=unix
let g:vim_json_syntax_conceal=0
set shortmess+=I
set textwidth=80
set formatoptions=cq
set backspace=indent,eol,start

" node suffix help
set suffixesadd=.coffee,.js,.styl,.css
filetype plugin indent on
syntax enable " enable syntax processing
set autoindent

"when saving vimrc reload the source

  " fix slow escape in iterm2
  set ttimeout
  set notimeout
  set ttimeoutlen=20
"}}}
  " auto commands {{{
  autocmd BufWritePre * :silent! :call <SID>Respace()
  set autoread

  augroup checkfileupdate
    autocmd WinEnter * :silent :checktime
  augroup END

  augroup vimrc_autocmds
    hi OverLength ctermfg=NONE ctermbg=17
    autocmd BufEnter * match OverLength /\%80v.*/
  augroup END

  augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $myvimrc source $myvimrc
  augroup end

  augroup bufread,bufnewfile *.cson set filetype=coffee
  augroup bufread,bufnewfile *.json set filetype=json
  "}}}
"}}}
" COLORS AND FONTS {{{
"=====================================================================
set t_Co=260
set background=dark
colorscheme speyside

" choose font by gui
if has("gui_running")
if has("gui_gtk2")
  set guifont=Inconsolata\ 12
elseif has("gui_macvim")
  set guifont=Menlo\ Regular:h12
elseif has("gui_win32")
  set guifont=Consolas:h10:w4:cANSI
endif
endif

" }}}
" VIM UI {{{
"=====================================================================
" error notification {{{
set visualbell " set error flashing
set noerrorbells " no beeping
"}}}
" splits {{{
set splitbelow
set splitright
"}}}
" backups {{{
set nobackup " No backup files
set nowritebackup " Only in case you don't want a backup file while editing
set noswapfile " No swap files
"}}}
" general {{{
set cursorline
set lazyredraw " Redraw only when we need to
set viewoptions=folds,options,cursor,unix,slash " Better Unix Windows compatibility
set virtualedit=all " Allow for cursor beyond last character
set history=1000 " Store a ton of history (default is 20)
set hidden " Allow buffer switching without saving
set confirm " Confirm if you want to save
set tabpagemax=15 " Only show 15 page tabs
set showmode " Display the current mode
set linespace=0 " No extra spaces between rows
set nowrap " Do not wrap long lines
set scrolloff=1 " Minimum lines to keep above and below cursor
set ttyscroll=3 " Workaround for gvim screen redraw issues
"}}}
" window {{{
" gui {{{
" ****************
" go: GUI OPTIONS
" +: show
" -: hide
" ****************
set go-=T " Toolbar
set go-=m " Menu
set go-=l " Hide left sroll bar
set go-=L " Hide left scroll bar in split
set go-=R " Hide right scroll bar
set go-=r " Hide right scroll bar in split
"}}}
" size {{{
if has("gui_running")
  " GUI is running or is about to start.
  set lines=999 columns=999
endif

" For windows - sets the window to max size
if has("gui_running")
  if has("gui_win32")
    augroup GUIEnter * simalt ~x
  endif
endif
"}}}
"}}}
" spaces & tabs {{{
set tabstop=2 " Number of visual spaces per tab
set shiftwidth=2
set softtabstop=2 " Number of spaces in tab when editing
set expandtab " Tabs are spaces

"Show hidden chars
set list listchars=tab:»¬,trail:·
"}}}
" status bar + command line {{{
" ****************
set showcmd " Show command line in bottom bar
set wildmenu " Visual autocomplete for command menu

highlight Visual guibg=#333345

if has('statusline')
  set laststatus=2
  set statusline+=%{fugitive#statusline()} " Git status (courtesy of fugitive)

  " Broken down into easily includeable segments
  set statusline=%f%<\ " Filename
  set statusline+=[%{&ff}/%Y]\ " Filetype
  set statusline+=\[%{getcwd()}]%= " Current dir
  set statusline+=%w%h%m%r\ " Options
  set statusline+=%<%-14(%l,%c%V%)\ %p%% " Right aligned file nav info ruler
endif
"}}}
"line numbers {{{
set number " show line numbers
set nuw=4
"}}}
" mouse {{{
set mouse=a " Automatically enable mouse usage
set mousehide " Hide the mouse cursor while typing
"}}}
" searching {{{
set ic " Ignorecase
set smartcase
set incsearch " Search as characters are entered
set hlsearch " Highlight matches
set magic
"}}}
" folding {{{
" ****************
set foldenable " Enable folding
set foldlevel=99
set foldlevelstart=10 " Open mast folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=syntax

let g:SimpylFold_docstring_preview = 1
"}}}
"}}}
" MAPPING {{{
"=====================================================================

" ____Leader mappings
" Leader
let mapleader="\<Space>"

" __ Directory
" Change directory to current edited files directory
nmap <Leader>cd :cd %:p:h<CR>

" ____Resizing
nmap <tab>h :vert res -10<CR>
nmap <tab>l :vert res +10<CR>
nmap <tab>k :resize +10<CR>
nmap <tab>j :resize -10<CR>


" Tab shortcuts
nmap <Leader>nt :tabnew<CR>

" Close tab
nmap <Leader>xt :tabc<CR>

" Increment/decrement
nmap <Leader>a <c-a>
nmap <Leader>x <c-x>

" View and select buffers
nnoremap <Leader>l :ls<CR>:b<space>

" Quick change directory

"JSON prettyify and validate
map <Leader>jn :%!python3 -m json.tool<CR>

map <Leader>de :'<,'>!python -m base64 -d<CR>

" Searching
nnoremap \<Leader> :nohlsearch<CR>

" ****************
" OS copy/paste
" ****************

" Copy/paste to system clipboard
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

nmap <Leader>cp :let @+ = expand("%")<cr>


map <Leader>ag :Ack<Space>

" Saving

map <Leader>wr :w<CR>

" Vimrc
nmap <Leader>vr :vsplit $MYVIMRC<CR>

" Edit colorscheme
nmap <Leader>ec :call ToggleColorEdit()<cr>

" Coffee
nmap <Leader>cc :CoffeeCompile<CR> " Compile

" ____SPLIT CONTROLS
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

nnoremap - :call OpenView()<CR>
"}}}
" {{{ FUNCTIONS
function! <SID>Respace()
   let l = line(".")
   let c = col(".")
   %s#\S\zs\s\s\ze\S# #ge "Double spaces
   %s#\s\+$##ge "Spacing at EOL
   nohlsearch
   call cursor(l, c)
endfunction

function! ToggleColorEdit()
  if !exists("g:editing_colors")
    let g:editing_colors = 1
    :vsplit ~/.vim/pack/colorschemes/opt/speyside/colors/speyside.vim
    :so $VIMRUNTIME/syntax/hitest.vim
    :XtermColorTable
  else
    unlet g:editing_colors
    :silent! :bd Highlight\ test | :bd */speyside.vim | :bd XtermColorTable
  endif
endfunction

function! OpenView()
  if isdirectory(expand('%:h'))
    :Ex %:h
  else
    :Ex .
  endif
endfunction
" }}}
" PLUGINS CONFIGS {{{
"=====================================================================
" AG - the silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" NETRW
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 1
let g:netrw_liststyle = 0
let g:netrw_banner = 0
let g:netrw_localrmdir='rm -r'
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"

" CTRL P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP ./'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
"
" Set the max files
let g:ctrlp_max_files = 10000

" Optimize file searching
if has("unix")
let g:ctrlp_user_command = {
  \ 'types': {
  \ 1: ['.git/', 'cd %s && git ls-files']
  \ },
  \ 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
  \ }
endif

"HomeGrown
nnoremap <leader>v :call Viper()<CR>
nnoremap <Leader>xw :SubW<space>
nnoremap <Leader>xs :SubSW<space>
"}}}

" vim: fdm=marker foldminlines=1
