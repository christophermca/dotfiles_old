if(exists('g:loaded_viper') && g:loaded_viper) || version < 700
  finish
endif

let g:loaded_viper = 1
let config = './config'

function! Viper()
  echo config
  echo 'echo echo echo echo echo'
endfunction

command! Viper :call Viper()

