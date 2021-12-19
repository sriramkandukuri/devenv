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
|\\+h| Previous Answer works only inside cheat buffer|
|\\+j| Next Question works only inside cheat buffer|
|\\+k| Previous Question works only inside cheat buffer|
|\\+l| Next Answer works only inside cheat buffer|
|\\+H| Previous history works only inside cheat buffer|
|\\+J| Next "See also" works only inside cheat buffer|
|\\+K| Previous "See also" works only inside cheat buffer|
|\\+L| Next history works only inside cheat buffer|

### Clang plugin

|Shortcut|Description|
|---|---|
|Space+=|Format file or visual selection wrt clang definitions

### Coc completions

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

### Comments

|Shortcut|Description|
|---|---|
|Space+//|Comment out current line or visual selection|

### Copy paste

|Shortcut|Description|
|---|---|
|FnKey F9|Toggle mouse
|Shift+FnKey F9|Toggle mouse and number sign columns this is usefull for copying using mouse selection
|Ctrl + FnKey F9|Toggle number and sign columns without changing mouse state
|Ctrl + l|Toggle line number format from relative to absolute and vice versa
|Space+y|Copy selected text to some temporary file, use this for copy pasting between files opened in different shells|
|Space+p|Paste copied(using Space+y) text, use this for copy pasting between files opened in different shells|
|Space+d|Delete a selection or line to black hole buffer so that it wont stored in clipboard

### Cscope

|Shortcut|Description|
|---|---|
|Space+c+o|Connect to cscope db using already existing cscope.out file
|Space+c+s|cscope Find this C symbol
|Space+c+d|cscope Find global definition
|Space+c+c+b|cscope Find functions called by this function
|Space+c+c|cscope Find functions calling this function
|Space+c+t|cscope Find this text string
|Space+c+e|cscope Find this egrep pattern
|Space+c+f|cscope Find this file
|Space+c+i|cscope Find files #including this file
|Space+c+a|cscope Find assignments of a variable this file

### Dirdiff plugin

|Shortcut|Description|
|---|---|
|w,s,d|Ignore white space in diff windows, remember 'w'hite 's'pace 'd'isable|
|w,s,e|Shows white space in diff windows, remember 'w'hite 's'pace 'e'nable|

### Fuzzy finder fzf plugin

|Shortcut|Description|
|---|---|
|Space+Space|Search through files, enter to open selected file|
|Space+C|Search through available color schemes and activate upon enter|
|Space+<ENTER>|Search through available buffers and enter to open selected one|
|Space+L|Search through lines having some pattern you enter|
|Space+f|Invoke ripgrep|
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
|Space+8|Add doxygen style comments before current line|
|Space+`\`|Append line end comments Use only for c style doxygen comments for structure or parameter variables.|

### Git

|Shortcut|Description|
|---|---|
|Space + G|Enter Git status page|
|cc|in fugitive buffer commit the changes

### Plugins

|Shortcut|Description|
|---|---|
|Function key F5|Refresh all plugins|

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
|Space+\<TAB\>|Goto next buffer opened|
|Space+Shift+\<TAB\>|Goto previous buffer opened|

### Plugins

|Shortcut|Description|
|---|---|
|Space+p+r|Refresh all plugins|

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

### Undo

|Shortcut|Description|
|---|---|
|Space+u|show undo tree in spliview|

### Lsp init

|Shortcut|Description|
|---|---|
|gd|go to definition|
|gr|rename symbol|
|gR|go to references|
|gy|go to type definition|
|gk|hover to get the signature help of the word under cursor|
|gss|organize|
|\[a|previous diagnostic|
|\]a|next diagnostic|
|ga|show code actions|
|gl|show line diagnostics as popup|
|Space `d|toggle diagnostics|
|Ctrl+l|show signature help in insert mdoe|

### Plugins

|Shortcut|Description|
|---|---|
|F5|Refresh plugins|

### Tscope

|Shortcut|Description|
|---|---|
|Space+Space|Search through git files, enter to open selected file|
|Space+g+f|Search through files, enter to open selected file|
|Space+f|Search files having current word|
|Space+fl|Invoke ripgrep|
|Space+\<ENTER\>|Search through available buffers and enter to open selected one|
|Space+vh|Search through available help tags|
|Space+dv|Search through devenv files|
|Space+ts|Open telescope builtin commands in telescope|

