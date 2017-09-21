function! speyside#overrides#Dark(mode, background) abort
  echom 'dark overrides go here'
endfunction

function! speyside#overrides#Light(mode, background) abort
  augroup speysideOverrides
    autocmd!
    let speysideOverridesDict = {
          \'Normal': {'mode': a:mode, 'fg': 0, 'bg': a:background}
          \}

    call <SID>_exectuteOverride(speysideOverridesDict)

  augroup END
endfunction

function! s:_exectuteOverride(overrides)
  for k in keys(a:overrides)
    let s:name = k
    let override = a:overrides[k]

    if exists(override['mode'])
      let s:mode = override['mode']
    endif
    if exists(override['fg'])
      let s:fg = override['fg']
    endif
    if exists(override['bg'])
      let s:bg = override['bg']
    endif
    if exists(override['styl'])
      echo '>> here'
      let s:styl = override['styl']
    endif

    "echo 'hi \"' . s:name . '\" ' . s:mode . \'fg=\' . s:fg . s:mode. \'bg=' . s:bg

  endfor

  colorscheme speyside " executes autocmd ColorScheme

endfunction



