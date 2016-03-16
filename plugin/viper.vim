" viper.vim - A test runner runner
" Maintainer:   ChristopherMCA
" Version:      1.0

if exists("g:loaded_commentary") || &cp || v:version < 700
  finish
endif
let g:loaded_viper = 1
let test_config = ./config

function! Runtests()
  test_config.run

command! -nargs=0  Runtests :call RunTests()
nmap <Leader>vt :Runtests<CR>
