"Some helper functions
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

function! ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
  let l:save = winsaveview()
  :%s/\n\{3,}/\r\r/e
  " :v/\S/,/\S/-j
  call winrestview(l:save)
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
""VH |FnKey F10|Show trailing spaces in a file|
nnoremap <F10>     :ShowSpaces 1<CR>
""VH |Shift+FnKey F10|Remove trailing spaces on a selected text|
nnoremap <S-F10>   m`:TrimSpaces<CR>``
vnoremap <S-F10>   :TrimSpaces<CR>
nnoremap <F22>   m`:TrimSpaces<CR>``
vnoremap <F22>   :TrimSpaces<CR>

"Trim white spaces before saving
"autocmd BufWritePre * :call TrimWhitespace()

