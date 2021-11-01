" Redirect any command output
function! Redir(cmd, rng, start, end)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		let cmd = a:cmd =~' %'
			\ ? matchstr(substitute(a:cmd, ' %', ' ' . expand('%:p'), ''), '^!\zs.*')
			\ : matchstr(a:cmd, '^!\zs.*')
		if a:rng == 0
			let output = systemlist(cmd)
		else
			let joined_lines = join(getline(a:start, a:end), '\n')
			let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
			let output = systemlist(cmd . " <<< $" . cleaned_lines)
		endif
	else
		redir => output
		execute a:cmd
		redir END
		let output = split(output, "\n")
	endif
	e /tmp/nvimredir
	" let w:scratch = 1
	setlocal buftype=nofile noswapfile
	call setline(1, output)
endfunction

command! -nargs=* -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)
""VH |Space+h+m|List all currently used maps to temporary buffer"
nnoremap <Leader>hm :Redir verbose map<CR>
""VH |Space+h+m|List all currently used highlights to temporary buffer"
nnoremap <Leader>hhi :Redir verbose hi<CR>
