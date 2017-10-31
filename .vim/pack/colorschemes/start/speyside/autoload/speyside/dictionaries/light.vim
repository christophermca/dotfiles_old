function! speyside#dictionaries#light#init(background)
  return {
      \'Normal': {'bg': a:background},
      \'Identifier':{'fg': 90}
      \}
endfunction
