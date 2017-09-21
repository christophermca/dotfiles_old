function! speyside#main#UpdateLuminance() abort
  if g:SpeysideLuminosity >= 2
    let g:SpeysideLuminosity = 0
  else
    let g:SpeysideLuminosity += 1
  endif
  echom g:SpeysideLuminosity
endfunction

function! speyside#main#UpdateColors(mode, background) abort
  if g:SpeysideLuminosity == 0
    :call <SID>_resetSpeyside()
  elseif g:SpeysideLuminosity == 1
    :call speyside#overrides#Dark(a:mode, a:background)
  elseif g:SpeysideLuminosity == 2
    :call speyside#overrides#Light(a:mode, a:background)
  endif
endfunction

function! s:_resetSpeyside() abort
   :au! speysideOverrides
   :colorscheme speyside
endfunction
