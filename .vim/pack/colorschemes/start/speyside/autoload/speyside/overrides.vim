function! speyside#overrides#Dark(background) abort
  echom 'dark overrides go here'

  "call <SID>_exectuteOverride(speysideOverridesDict)
endfunction

function! speyside#overrides#Light(background) abort
  let ColorDictionary = speyside#colors#init()
  echo ColorDictionary
  let speysideOverridesDict = {
        \'Normal': {'fg': get(ColorDictionary, 'black'), 'bg': a:background},
        \'CursorLine': {'bg': get(ColorDictionary, 'gray')[1]}
        \}

  call <SID>_exectuteOverride(speysideOverridesDict)

endfunction

function! s:_exectuteOverride(overrides) abort
  let new_highlight_color = ''

  for k in keys(a:overrides)
    let l:name = k
    let override = a:overrides[k]
    if has("gui_running")
      let s:mode = 'gui'
    else
      let s:mode = 'cterm'
    endif

    if has_key(override, 'fg')
      let fg = override.fg
      let new_highlight_color = new_highlight_color . s:mode . "fg=" . l:fg . ' '
    endif
    if has_key(override, 'bg')
      let bg = override.bg
      let new_highlight_color = new_highlight_color . s:mode . "bg=" . l:bg . ' '
    endif
    if has_key(override, 'styl')
      let l:styl = override.styl
      let new_highlight_color = new_highlight_color . s:mode . l:styl
    endif

    echo 'here: ' . l:new_highlight_color
    exe 'hi ' . l:name . ' ' . l:new_highlight_color

  endfor

  "colorscheme speyside " executes autocmd ColorScheme
endfunction
