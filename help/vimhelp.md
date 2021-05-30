## VIM/nvim Shortcuts

Please find below shortcuts provided for vim.

| Shortcut            | Description                                                                                                   |
|---------------------|---------------------------------------------------------------------------------------------------------------|
| <Space> G C         | Show git conflicts and navigate through conflicts by pressing n
| FnKey F9            | Toggle mouse
| Shift+FnKey F9      | Toggle mouse and number sign columns this is usefull for copying using mouse selection
| Ctrl + FnKey F9     | Toggle number and sign columns without changing mouse state
| Ctrl + l            | Toggle line number format from relative to absolute and vice versa
| FnKey F7            | Toggle spell check and show errors                                                                            |
| [s, ]s, [S, ]S      | Goto Next or previous spellcheck errors                                                                       |
| Space+v+r           | Reload vimrc                                                                                                  |
| Space+K+p           | Print ( cheat.sh )[ https://github.com/dbeniamine/cheat.sh-vim ] output below line                            |
| Space+K+P           | Print ( cheat.sh )[ https://github.com/dbeniamine/cheat.sh-vim ] output above line                            |
| Space+K+B           | Print ( cheat.sh )[ https://github.com/dbeniamine/cheat.sh-vim ] output new buffer                            |
| \+h                 | Previous Answer works only inside cheat buffer                                                                |
| \+j                 | Next Question works only inside cheat buffer                                                                  |
| \+k                 | Previous Question works only inside cheat buffer                                                              |
| \+l                 | Next Answer works only inside cheat buffer                                                                    |
| \+H                 | Previous history works only inside cheat buffer                                                               |
| \+J                 | Next "See also" works only inside cheat buffer                                                                |
| \+K                 | Previous "See also" works only inside cheat buffer                                                            |
| \+L                 | Next history works only inside cheat buffer                                                                   |
| Space+=             | Format file or visual selection wrt clang definitions
| Space+c+o           | Connect to cscope db using already existing cscope.out file
| Space+c+s           | **c**scope Find this C **s**ymbol
| Space+c+d           | **c**scope Find global **d**efinition
| Space+c+c+b         | **c**scope Find functions **c**alled **b**y this function
| Space+c+c           | **c**scope Find functions **c**alling this function
| Space+c+t           | **c**scope Find this **t**ext string
| Space+c+e           | **c**scope Find this **e**grep pattern
| Space+c+f           | **c**scope Find this **f**ile
| Space+c+i           | **c**scope Find files #**i**ncluding this file
| Space+c+a           | **c**scope Find **a**ssignments of a variable this file
| FnKey F8            | Toggle right side tagbar for all *.c,*.cpp,*.h,*.hpp files                                                    |
| w,s,d               | Ignore white space in diff windows, remember 'w'hite 's'pace 'd'isable                                        |
| w,s,e               | Shows white space in diff windows, remember 'w'hite 's'pace 'e'nable                                          |
| Space+q             | Toggle quick scope plugin which enables visual marking while using `t` shortcut to go to any position of line |
| Space+Space         | Search through files, enter to open selected file                                                             |
| Space+C             | Search through available color schemes and activate upon enter                                                |
| Space+<ENTER>       | Search through available buffers and enter to open selected one                                               |
| Space+L             | Search through lines having some pattern you enter                                                            |
| Space+f             | Invoke ripgrep                                                                                                |
| Space+RG            | Invoke ripgrep                                                                                                |
| Space+ag            | Invoke advance grep                                                                                           |
| Space+\`            | Search through available marks and enter into selected one                                                    |
| Space+m             | Search though maps/available shortcuts and use selected one                                                   |
| <Space>Fkey F12     | Toggle diagnostics and error strings"
| K                   | In escame mode pressing `K` on any word opens respective man/help page if available                           |
| -, Space+pv         | Open directory browser as split window on left side                                                           |
| Space+\<TAB\>       | Goto next buffer opened                                                                                       |
| Space+Shift+\<TAB\> | Goto previous buffer opened                                                                                   |
| Ctrl+w              | Close opened current buffer                                                                                   |
| Ctrl+s              | Save file                                                                                                     |
| Ctrl+Alt+s          | Save all files opened                                                                                         |
| Ctrl+q              | quit all files opened                                                                                         |
| Space+//            | Comment out current line or visual selection                                                                  |
| Space+8             | Add doxygen style comments before current line                                                                |
| Space+`\`           | Append line end comments Use only for c style doxygen comments for structure or parameter variables.          |
| Space+T             | Enter timestamp at cursor position                                                                            |
| Space+h             | Goto left window                                                                                              |
| Space+j             | Goto below window                                                                                             |
| Space+k             | Goto above window                                                                                             |
| Space+l             | Goto right window                                                                                             |
| Space+u             | show undo tree in spliview                                                                                    |
| Space+`+`           | Increase vertical width of window by 5 points                                                                 |
| Space+`-`           | Decrease vertical width of window by 5 points                                                                 |
| Space+y             | Copy selected text to some temporary file, use this for copy pasting between files opened in different shells |
| Space+p             | Paste copied(using Space+y) text, use this for copy pasting between files opened in different shells          |
| \<TAB\>             | Autocompleter if available                                                                                    |
| Shift+\<TAB\>       | Select previous from autocomplete dropdown                                                                    |
| Ctrl+Space          | refresh CoC database                                                                                          |
| Space+gd            | Goto definition of a function                                                                                 |
| Space+gy            | Goto type declaration of a function                                                                           |
| Space+gi            | Goto implementation of a function                                                                             |
| Space+gr            | Show references                                                                                               |
| Space+cr            | Restart CoC                                                                                                   |
| FnKey F10           | Show trailing spaces in a file                                                                                |
| Shift+FnKey F10     | Remove trailing spaces on a selected text                                                                     |
| `\|\|`              | In insert mode type two pipe symbols and ESC to activate table writitng                                       |
| `__`                | In insert mode type two underscore symbols and ESC to disable table writitng                                  |
| Space+T+T           | Realign tables in current file"
| Space+h+m           | List all currently used maps to temporary buffer"
| Space+h+m           | List all currently used highlights to temporary buffer"