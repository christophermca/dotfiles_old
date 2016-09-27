" Author: Christopher MCA
" Version: 1.0
" Sections:
"
" Colors & Fonts
" General
" VIM UI
" - GUI Options
" - Window Options
" - STATUS bar & COMMAND LINE
" - COLUMN RULE
" - LINE NUMBER
" - MOUSE
" - KEYBOARD_AND_MAPPING
" - SPLIT CONTROLS
" - SEARCHING
" - FOLDING
" Plugins
"=============================================================================
" Vim >= 7.0 specific colors
if !has('packages')
  source ~/.vundle
endif

" compatibility
set nocp

"=====================================================================
" COLORS AND FONTS
"=====================================================================
  set t_Co=260
  set background=dark
  colorscheme meta5
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

"=====================================================================
" GENERAL
"=====================================================================
  set fileformat=unix
  let g:vim_json_syntax_conceal=0
  set shortmess+=I
  set textwidth=80
  set formatoptions=cq
  set backspace=indent,eol,start

  " Node suffix help
  set suffixesadd=.coffee,.js,.styl,.css

  filetype plugin indent on
  syntax enable " enable syntax processing
  set autoindent

  "when saving vimrc reload the source
  augroup reload_vimrc
      autocmd!
      autocmd BufWritePost $MYVIMRC source $MYVIMRC
  augroup END

  augroup BufRead,BufNewFile *.cson set filetype=coffee
  augroup BufRead,BufNewFile *.json set filetype=json

  " fix slow escape in iterm2
  set ttimeout
  set notimeout
  set ttimeoutlen=20

"=====================================================================
" VIM UI
"=====================================================================
  " Error notification
    set visualbell " set error flashing
    set noerrorbells " no beeping

  " how to split
    set splitbelow
    set splitright

  " backups
    set nobackup " No backup files
    set nowritebackup " Only in case you don't want a backup file while editing
    set noswapfile " No swap files

  " Config
    set cursorline
    set lazyredraw " Redraw only when we need to
    set viewoptions=folds,options,cursor,unix,slash " Better Unixg<CR>Windows compatibility
    set virtualedit=all " Allow for cursor beyond last character
    set history=1000 " Store a ton of history (default is 20)
    set hidden " Allow buffer switching without saving
    set confirm " Confirm if you want to save
    set tabpagemax=15 " Only show 15 page tabs
    set showmode " Display the current mode
    set linespace=0 " No extra spaces between rows
    set nowrap " Do not wrap long lines
    set scrolloff=3 " Minimum lines to keep above and below cursor
    set ttyscroll=3 " Workaround for gvim screen redraw issues


    " auto load file
    set autoread
    augroup FocusGained,BufEnter * :silent! checktime
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

  " ****************
  " SPACES & TABS
  " ****************
    set tabstop=2 " Number of visual spaces per tab
    set shiftwidth=2
    set softtabstop=2 " Number of spaces in tab when editing
    set expandtab " Tabs are spaces

  "Show hidden chars
    set list listchars=tab:»¬,trail:·

  " ****************
  " WINDOW SIZE
  " ****************
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

  " ****************
  " STATUS BAR + COMMAND LINE
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

  " ****************
  " COLUMN RULER
  " ****************
    augroup vimrc_autocmds
      hi OverLength ctermfg=NONE ctermbg=17
      autocmd BufEnter * match OverLength /\%80v.*/
    augroup END

" set colorcolumn=120

  " To tone down the coloring
    " highlight ColorColumn guibg=Gray12

  " ****************
  "LINE NUMBERS
  " ****************
    set number " show line numbers
    set nuw=3 " number width to 6 makes things look a little neater

  " ****************
  " MOUSE
  " ****************
    set mouse=a " Automatically enable mouse usage
    set mousehide " Hide the mouse cursor while typing

  " ****************
  " SEARCHING
  " ****************
    set ic " Ignorecase
    set smartcase
    set incsearch " Search as characters are entered
    set hlsearch " Highlight matches
    set magic

  " ****************
  " FOLDING
  " ****************
    set foldenable " Enable folding
    set foldmethod=indent " Fold based on indent level
    set foldlevel=99
    set foldlevelstart=10 " Open mast folds by default
    set foldnestmax=10 " 10 nested fold max

    let g:SimpylFold_docstring_preview = 1
  " let g:SimpylFold_fold_docstring = 0

  " ****************
  " KEYBOARD_AND_MAPPING
  " ****************
     " ____Leader mappings
     " Leader
     "nnoremap <Space> <Nop>
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
        " New
        nmap <Leader>nt :tabnew<CR>

        " Close tab
        nmap <Leader>xt :tabc<CR>

     " Increment/decrement
     nmap <Leader>a <c-a>
     nmap <Leader>x <c-x>

     " View and select buffers
     nnoremap <Leader>l :ls<CR>:b<space>

     " Quick change directory
       " nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

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

    " AG - the silver searcher
    if executable('ag')
      let g:ackprg = 'ag --vimgrep'
    endif

    map <Leader>ag <Leader>ac
    map <Leader>ac :Ack<Space>

    " Saving
    function! Respace()
      :%s#\S\zs\s\+# #ge
      :%s#\s\+$##ge
      :nohlsearch
    endfunction

    map <Leader>wr :w<CR>
    autocmd BufWritePre . call Respace()

    " Save+ reload vimrc
    map <Leader>ws w<CR> :so $MYVIMRC<CR>

    " Vimrc
    nmap <Leader>vr :vsplit $MYVIMRC<CR>

     " Coffee
        " Compile
        nmap <Leader>cc :CoffeeCompile<CR>

     " ____SPLIT CONTROLS
     nmap <C-h> <C-w>h
     nmap <C-l> <C-w>l
     nmap <C-k> <C-w>k
     nmap <C-j> <C-w>j

     " ____CTRL P
     let g:ctrlp_map = '<c-p>'
     let g:ctrlp_cmd = 'CtrlP ./'
     let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

"=====================================================================
" PlUGINS configs
"=====================================================================

   " CTRL P
   set runtimepath^=~/.vim/bundle/ctrlp.vim
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
