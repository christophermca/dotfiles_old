function! ToggleLuminance(...)
  if g:SpeysideLuminosity >= 3
    let g:SpeysideLuminosity = 0
  else
    let g:SpeysideLuminosity += 1
  endif
endfunction
