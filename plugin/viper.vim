" viper.vim - A test runner runner
" Maintainer:   ChristopherMCA
" Version:      1.0

if exists("g:loaded_viper") || &cp || v:version < 700
  finish
endif

let g:loaded_viper = 1
let test_config = ./config

function! s:Runtests()
  echo 'test_config'
  test_config.run

if !hasmapto('<Plug>Commentary') || maparg('gc','n') ==# ''
  nmap gc  <Plug>Commentary
endif
