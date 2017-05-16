autocmd BufWritePre * :call <SID>Test()

function! <SID>Test()
  :echo 'farts'
  :echom expand('%:p:h')

endfunction
