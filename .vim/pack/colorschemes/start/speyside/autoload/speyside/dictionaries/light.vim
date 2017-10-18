function! speyside#dictionaries#light#init(background)
  return {
      \'Normal': {'fg': ['black'], 'bg': a:background},
      \'Number': {'fg': 229},
      \'CursorLine': {'fg': 'NONE', 'bg': ['gray', 1,]},
      \'Directory': {'fg': 26, 'bg': 'NONE'},
      \'SpecialKey': {'fg': 75, 'bg': 'NONE'},
      \'PreProc': {'fg': 75, 'bg': 'NONE'},
      \'Nontext': {'fg': 0, 'bg': 'NONE'},
      \'Function': {'fg':35},
      \'Statement': {'bg':8},
      \'String': {'fg':104 , 'styl': 'bold'},
      \'Special': {'bg': 'NONE'},
      \'Type': {'fg': 117, 'styl': 'bold'},
      \'Identifier': {'fg':35 , 'styl': 'bold'}
      \}
endfunction
