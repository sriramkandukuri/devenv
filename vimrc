"let s:vim_runtime = expand('<sfile>:p:h')."/.."
"lett s:vim_runtime = ~/devenv/vim/bundle
"call pathogen#infect(s:vim_runtime.'/*')
let g:go_version_warning = 0
set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

let s:vim_runtime = "~/devenv/vim/bundle"
call pathogen#infect(s:vim_runtime.'/*')

colorscheme dracula

"set number
"set colorcolumn=128
set cursorline
