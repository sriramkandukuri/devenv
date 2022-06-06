" Dir diff options
let g:DirDiffEnableMappings = 1
let g:DirDiffExcludes = "*__pycache__*,cscope.files,cscope.out,tags,*.o,*.so,*.a,CVS,*.class,*.exe,.*.swp,*.git*"
let g:DirDiffIgnore = "Id:,Revision:,Date:"
let g:DirDiffAddArgs = "-w -B"
set diffopt+=iwhite
set diffexpr=MyDiff()
function MyDiff()
    let opt = ""
    if &diffopt =~ "icase"
        let opt = opt . "-i "
    endif
    if &diffopt =~ "iwhite"
        let opt = opt . "-w -B " " vim uses -b by default
    endif
    silent execute "!diff -a --binary " . opt .
                \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction
""VH |w,s,d|Ignore white space in diff windows, remember 'w'hite 's'pace 'd'isable|
map wsd :set diffopt+=iwhite<CR>
""VH |w,s,e|Shows white space in diff windows, remember 'w'hite 's'pace 'e'nable|
map wse :set diffopt-=iwhite<CR>
