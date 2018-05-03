if exists('g:loaded_vim_cursor_shape') || !has("cursorshape")
  finish
endif

" Bail out early if not running under a terminal.
if has("gui_running")
  finish
endif

let g:loaded_vim_cursor_shape = 1

if &term =~ "xterm.*" || &term =~ "screen.*"
  set nocompatible

  let s:ansi_dcs = "\<Esc>P"
  let s:ansi_st = "\<Esc>\\"

  let s:blink_vertical = "\<Esc>[5 q"
  let s:blink_block = "\<Esc>[1 q"
  if exists('$STY')
    " GNU Screen
    let &t_SI .= s:ansi_dcs . s:blink_vertical . s:ansi_st
    let &t_EI .= s:ansi_dcs . s:blink_block . s:ansi_st
  else
    let &t_SI .= s:blink_vertical
    let &t_EI .= s:blink_block
  endif
endif
