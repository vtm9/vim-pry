if exists("g:loaded_pry") || &cp || v:version < 700
  finish
endif

let g:loaded_pry = 1

let g:pry_map = {
      \ 'ruby' : "require 'pry'; binding.pry",
      \ 'slim' : "- require 'pry'; binding.pry",
      \ 'coffee' : 'debugger',
      \ 'javascript' : 'debugger',
      \ 'javascript.jsx' : 'debugger',
      \ 'elixir' : 'require IEx; IEx.pry',
      \ 'python' : 'import pdb; pdb.set_trace()',
      \}

function! pry#insert()
  if has_key(g:pry_map, &filetype)
    let text = get(g:pry_map, &filetype)
    call feedkeys('o', 'i')
    call feedkeys(text)
    call feedkeys("\<Esc>")
  else
    echo 'No mapping defined for filetype: ' . &filetype
  endif
endfunction
