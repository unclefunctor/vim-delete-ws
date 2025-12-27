" Delete whitespace from the cursor to the next word plugin
"
" Copyright 2025, MIT Licensed

" ASSumes the cursor is at 'start_col'
function! s:delete_ws(start_col)
   if getline('.')[a:start_col - 1] !~ '\s'
      return
   endif
   let l:next_word_col = searchpos('\S', 'nW')[1]

   if l:next_word_col > a:start_col
   let l:delete_count = l:next_word_col - a:start_col
      execute 'normal! ' . l:delete_count . 'x'
   endif
endfunction

function! s:delete_ws_line() abort
   let l:start_col = getcurpos()[2]
   call s:delete_ws(l:start_col)

   silent! call repeat#set("\<Plug>DWRepeat", 1)
endfunction
nnoremap <silent> <Plug>DWRepeat :<C-u>call DeleteWs()<CR>

function! s:delete_ws_block() abort
   let l:start_col = getcurpos()[2]

   for l:line in range(line("'<"), line("'>"))
      call cursor(l:line, l:start_col)
      call s:delete_ws(l:start_col)
   endfor
endfunction

noremap <silent> <expr> d<Space> mode() == "\<C-v>"
   \ ? ":<C-u>call <SID>delete_ws_block()<CR>"
   \ : ":<C-u>call <SID>delete_ws_line()<CR>"
