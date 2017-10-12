let s:ColorDictionary = g:SpeysideColorDictionary
function! speyside#overrides#Dark(background) abort
  echo 'dark overrides go here'
  augroup speysideOverrides
    autocmd!
    let l:speysideOverridesDict = {
        \'Normal': {'bg': a:background,},
        \}

    call <SID>_exectuteOverride(l:speysideOverridesDict)

  augroup END
endfunction

function! speyside#overrides#Light(background) abort
  augroup speysideOverrides
    autocmd!
    let l:speysideOverridesDict = {
          \'Normal': {'fg': get(s:ColorDictionary, 'black'), 'bg': a:background},
          \'Number': {'fg': 229,},
          \'CursorLine': {'fg': 'NONE', 'bg': get(s:ColorDictionary, 'gray')[1]},
          \'Directory': {'bg':'NONE', 'fg': 26},
          \'SpecialKey': {'bg':'NONE', 'fg': 75},
          \'PreProc': {'bg':'NONE', 'fg': 75},
          \';Nontext': {'bg':'NONE', 'fg': 0},
          \'Function': {'fg':35 },
          \'String': {'fg':104 , 'styl': 'bold'},
          \'Identifier': {'fg':35 , 'styl': 'bold'}
          \}

    call <SID>_exectuteOverride(l:speysideOverridesDict)

  augroup END
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
      let styl = override.styl
      let new_highlight_color = new_highlight_color . s:mode . '=' .  styl . ' '
    endif

    exe 'hi ' . l:name . ' ' . l:new_highlight_color

  endfor

  "colorscheme speyside " executes autocmd ColorScheme
endfunction
