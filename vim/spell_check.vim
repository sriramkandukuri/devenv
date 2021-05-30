set spelllang=en
if has("spell")
  " turn spelling on by default
  " set spell

  " toggle spelling with F7 key
""VH |FnKey F7|Toggle spell check and show errors|
""VH |[s, ]s, [S, ]S|Goto Next or previous spellcheck errors|
  map <F7> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

  " they were using white on white
  highlight PmenuSel ctermfg=black ctermbg=lightgray

  " limit it to just the top 10 items
  set sps=best,10
endif


