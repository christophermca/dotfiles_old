" viper.vim - A test runner runner
" Maintainer:   ChristopherMCA
" Version:      1.0

if exists("g:loaded_viper") || &cp || v:version < 700
  finish
endif

let g:loaded_viper = 1
let test_config = './config'

function! Runtests()
  echo 'test_config'
endfunction


if g:loaded_viper
    nnoremap <leader>[s :call <sid>Runtests()<CR>
endif
