## VIM/nvim Shortcuts

Please find below shortcuts provided for vim.

### All maps

|Shortcut|Description|
|---|---|
|Space+h+m|List all currently used maps to temporary buffer"
|Space+h+m|List all currently used highlights to temporary buffer"

### Buffer management

|Shortcut|Description|
|---|---|
|Ctrl+w|Close opened current buffer|
|Ctrl+s|Save file and go to Normal mode|
|Ctrl+Alt+s|Save all files opened and go to Normal mode|
|Ctrl+Enter|Save file and be in current mode|
|Ctrl+q|quit all files opened|

### Cheatsheet plugin

|Shortcut|Description|
|---|---|
|Space+K+p|Print ( cheat.sh )[ https://github.com/dbeniamine/cheat.sh-vim ] output below line|
|Space+K+P|Print ( cheat.sh )[ https://github.com/dbeniamine/cheat.sh-vim ] output above line|
|Space+K+B|Print ( cheat.sh )[ https://github.com/dbeniamine/cheat.sh-vim ] output new buffer |
|\+h| Previous Answer works only inside cheat buffer|
|\+j| Next Question works only inside cheat buffer|
|\+k| Previous Question works only inside cheat buffer|
|\+l| Next Answer works only inside cheat buffer|
|\+H| Previous history works only inside cheat buffer|
|\+J| Next "See also" works only inside cheat buffer|
|\+K| Previous "See also" works only inside cheat buffer|
|\+L| Next history works only inside cheat buffer|

### Clang plugin

|Shortcut|Description|
|---|---|
|Space+=|Format file or visual selection wrt clang definitions

### Comments

|Shortcut|Description|
|---|---|
|Space+//|Comment out current line or visual selection|
|Space+8|Add doxygen style comments before current line|
|Space+`\`|Append line end comments Use only for c style doxygen comments for structure or parameter variables.|
|Space+\<TAB\>|Goto next buffer opened|
|Space+Shift+\<TAB\>|Goto previous buffer opened|

### Completions

|Shortcut|Description|
|---|---|
|<Space>Fkey F12|Toggle diagnostics and error strings"
|\<TAB\>|Autocompleter if available|
|Shift+\<TAB\>|Select previous from autocomplete dropdown|
|Ctrl+Space|refresh CoC database|
|Space+gd|Goto definition of a function|
|Space+gy|Goto type declaration of a function|
|Space+gi|Goto implementation of a function|
|Space+gr|Show references|
|Space+cr|Restart CoC|

### Copy paste

|Shortcut|Description|
|---|---|
|FnKey F9|Toggle mouse
|Shift+FnKey F9|Toggle mouse and number sign columns this is usefull for copying using mouse selection
|Ctrl + FnKey F9|Toggle number and sign columns without changing mouse state
|Ctrl + l|Toggle line number format from relative to absolute and vice versa
|Space+y|Copy selected text to some temporary file, use this for copy pasting between files opened in different shells|
|Space+p|Paste copied(using Space+y) text, use this for copy pasting between files opened in different shells|

### Cscope

|Shortcut|Description|
|---|---|
|Space+c+o|Connect to cscope db using already existing cscope.out file
|Space+c+s|**c**scope Find this C **s**ymbol
|Space+c+d|**c**scope Find global **d**efinition
|Space+c+c+b|**c**scope Find functions **c**alled **b**y this function
|Space+c+c|**c**scope Find functions **c**alling this function
|Space+c+t|**c**scope Find this **t**ext string
|Space+c+e|**c**scope Find this **e**grep pattern
|Space+c+f|**c**scope Find this **f**ile
|Space+c+i|**c**scope Find files #**i**ncluding this file
|Space+c+a|**c**scope Find **a**ssignments of a variable this file

### Dirdiff plugin

|Shortcut|Description|
|---|---|
|w,s,d|Ignore white space in diff windows, remember 'w'hite 's'pace 'd'isable|
|w,s,e|Shows white space in diff windows, remember 'w'hite 's'pace 'e'nable|

### File explorer

|Shortcut|Description|
|---|---|
|-, Space+pv|Open directory browser as split window on left side|

### Fuzzy finder fzf plugin

|Shortcut|Description|
|---|---|
|Space+C|Search through available color schemes and activate upon enter|
|Space+L|Search through lines having some pattern you enter|
|Space+RG|Invoke ripgrep|
|Space+ag|Invoke advance grep|
|Space+\`|Search through available marks and enter into selected one|
|Space+m|Search though maps/available shortcuts and use selected one|

### General

|Shortcut|Description|
|---|---|
|Space+v+r|Reload vimrc|
|Space+T|Enter timestamp at cursor position|
|Space,g,f|Open file under cursor, create if not exist"
|Space+T|Enter timestamp at cursor position|

### Git

|Shortcut|Description|
|---|---|
|Space G C |Show git conflicts and navigate through conflicts by pressing n

### Man pages

|Shortcut|Description|
|---|---|
|K|In escame mode pressing `K` on any word opens respective man/help page if available|

### Navigation

|Shortcut|Description|
|---|---|
|Space+h|Goto left window|
|Space+j|Goto below window|
|Space+k|Goto above window|
|Space+l|Goto right window|
|Space+`+`|Increase vertical width of window by 5 points|
|Space+`-`|Decrease vertical width of window by 5 points|

### Quickscope plugin

|Shortcut|Description|
|---|---|
|Space+q|Toggle quick scope plugin which enables visual marking while using `t` shortcut to go to any position of line|

### Remove unwanted spaces

|Shortcut|Description|
|---|---|
|FnKey F10|Show trailing spaces in a file|
|Shift+FnKey F10|Remove trailing spaces on a selected text|

### Spell check

|Shortcut|Description|
|---|---|
|FnKey F7|Toggle spell check and show errors|
|[s, ]s, [S, ]S|Goto Next or previous spellcheck errors|

### Table plugin

|Shortcut|Description|
|---|---|
|`\|\|`|In insert mode type two pipe symbols and ESC to activate table writitng|
|`__`|In insert mode type two underscore symbols and ESC to disable table writitng|
|Space+T+T|Realign tables in current file"

### Tagbar plugin

|Shortcut|Description|
|---|---|
|FnKey F8|Toggle right side tagbar for all *.c,*.cpp,*.h,*.hpp files|

### Telescope plugin

|Shortcut|Description|
|---|---|
|Space+Space+g|Search through git files, enter to open selected file|
|Space+Space|Search through files, enter to open selected file|
|Space+f|Invoke ripgrep|
|Space+<ENTER>|Search through available buffers and enter to open selected one|
|Space+vh|Search through available help tags|
|Space+vh|Search through devenv files|

### Undo

|Shortcut|Description|
|---|---|
|Space+u|show undo tree in spliview|

