"{{{ Cheat sheet configuration

" Vim command used to open new buffer
let g:CheatSheetReaderCmd='new'

" Cheat sheet file type
let g:CheatSheetFt='markdown'

" Program used to retrieve cheat sheet with its arguments
let g:CheatSheetUrlGetter='curl --silent'

" Flag to add cookie file to the query
let g:CheatSheetUrlGetterIdFlag='-b'

" cheat sheet base url
let g:CheatSheetBaseUrl='https://cht.sh'

" cheat sheet settings do not include style settings neiter comments,
" see other options below
let g:CheatSheetUrlSettings='q'

" cheat sheet pager
let g:CheatPager='less -R'

" pygmentize theme used for pager output, see :CheatPager :styles-demo
" let g:CheatSheetPagerStyle=rrt

" Show comments in answers by default
" (setting this to 0 means giving ?Q to the server)
let g:CheatSheetShowCommentsByDefault=1

" Stay in origin buffer (set to 0 to keep focus on the cheat sheet buffer)
let g:CheatSheetStayInOrigBuf=1

" cheat sheet buffer name
let g:CheatSheetBufferName="_cheat"

" Default selection in normal mode (line for whole line, word for word under cursor)
let g:CheatSheetDefaultSelection="line"

" Default query mode
" 0 => buffer
" 1 => replace (do not use or you might loose some lines of code)
" 2 => pager
" 3 => paste after query
" 4 => paste before query
let g:CheatSheetDefaultMode=0

" Path to cheat sheet cookie
let g:CheatSheetIdPath=expand('~/.cht.sh/id')

" Make plugin silent by  setting bellow variable to 1
let g:CheatSheetSilent=0
let g:CheatDoNotReplaceKeywordPrg=1
autocmd BufRead,BufNewFile _cheat :maplocalleader="\\"

""VH |Space+K+p|Print ( cheat.sh )[ https://github.com/dbeniamine/cheat.sh-vim ] output below line|
""VH |Space+K+P|Print ( cheat.sh )[ https://github.com/dbeniamine/cheat.sh-vim ] output above line|
""VH |Space+K+B|Print ( cheat.sh )[ https://github.com/dbeniamine/cheat.sh-vim ] output new buffer |
""VH |\+h| Previous Answer works only inside cheat buffer|
""VH |\+j| Next Question works only inside cheat buffer|
""VH |\+k| Previous Question works only inside cheat buffer|
""VH |\+l| Next Answer works only inside cheat buffer|
""VH |\+H| Previous history works only inside cheat buffer|
""VH |\+J| Next "See also" works only inside cheat buffer|
""VH |\+K| Previous "See also" works only inside cheat buffer|
""VH |\+L| Next history works only inside cheat buffer|
"
""}}}
