set runtimepath^=~/.vim,~/.vim/pack,~/.vim/pack/packer,~/.vim/pack/packer/start,~/.vim/after,~/devenv/vim,~/.local/share/nvim/site/pack/packer/start
let &packpath = &runtimepath

if has('nvim')
packadd packer.nvim
:lua <<EOF
require("devenv")
EOF
else
source ~/devenv/vim/plugins.vim
endif

source ~/devenv/vim/general.vim

" Dont move above lines

if !has('nvim')
source ~/devenv/vim/coc_completions.vim
source ~/devenv/vim/comments.vim
source ~/devenv/vim/clang_plugin.vim
source ~/devenv/vim/tagbar_plugin.vim
source ~/devenv/vim/vimade_plugin.vim
endif
source ~/devenv/vim/devenv.vim
source ~/devenv/vim/undo.vim
source ~/devenv/vim/code_style.vim
source ~/devenv/vim/copy_paste.vim
source ~/devenv/vim/spell_check.vim
source ~/devenv/vim/uncrustify_plugin.vim
source ~/devenv/vim/google_plugin.vim
source ~/devenv/vim/cheatsheet_plugin.vim
source ~/devenv/vim/cscope.vim
source ~/devenv/vim/markdown_plugin.vim
source ~/devenv/vim/dirdiff_plugin.vim
source ~/devenv/vim/quickscope_plugin.vim
source ~/devenv/vim/man_pages.vim
source ~/devenv/vim/buffer_management.vim
source ~/devenv/vim/navigation.vim
source ~/devenv/vim/remove_unwanted_spaces.vim
source ~/devenv/vim/table_plugin.vim
source ~/devenv/vim/all_maps.vim
source ~/devenv/vim/easy_align_plugin.vim
source ~/devenv/vim/git.vim
source ~/devenv/vim/abolish.vim
" source ~/devenv/vim/nvimtree_plugin.vim

" source ~/devenv/vim/goyo_limelight_plugin.vim
