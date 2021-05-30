"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ripgrep plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
    let g:rg_derive_root='true'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctrlp file search plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"netrw source tree browser plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_browse_split = 4
let g:netrw_winsize = -30
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
""VH |-, Space+pv|Open directory browser as split window on left side|
function! ToggleVimExplorer()
    let i = bufnr("$")
    let wasOpen = 0
    while (i >= 1)
        if (getbufvar(i, "&filetype") == "netrw")
            silent exe "bwipeout " . i
            let wasOpen = 1
        endif
        let i-=1
    endwhile
    if !wasOpen
        silent Lexplore
        wincmd l
    endif
endfunction

nnoremap - :call ToggleVimExplorer()<cr>
"nnoremap - :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
function! PDrawAUCMD()
    :Vex
    :wincmd l
endfunction
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * call ToggleVimExplorer()
" augroup END


