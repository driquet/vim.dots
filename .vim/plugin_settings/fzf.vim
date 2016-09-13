" This is the default extra key bindings
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }

" Default fzf layout
let g:fzf_layout = { 'down': '~40%' }

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors call fzf#vim#colors({'left':'15%'})

function! s:escape(path)
	return substitute(a:path, ' ', '\\ ', 'g')
endfunction

function! AgHandler(line)
	let parts = split(a:line, ':')
	let [fn, lno] = parts[0 : 1]
	execute 'tabnew '. s:escape(fn)
	execute lno
	normal! zz
endfunction

command! -nargs=+ Fag call fzf#run({
	\ 'source': 'ag --color --nobreak --noheading "<args>"',
	\ 'sink': function('AgHandler'),
	\ 'options': '+m +e --ansi',
	\ 'tmux_height': '60%'
	\ })

" ----------------------------------------------------------------------------
"  " BTags
"  "
"  ----------------------------------------------------------------------------
function! s:align_lists(lists)
	let maxes = {}
	for list in a:lists
		let i = 0
		while i < len(list)
			let maxes[i] = max()
			let i += 1
		endwhile
	endfor
	for list in a:lists
		call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
	endfor
	return a:lists
endfunction

function! s:btags_source()
	let lines = map(split(system(printf(
				\ 'ctags -f - --sort=no --fields=nKs --excmd=pattern --language-force=%s %s',
				\ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
	if v:shell_error
		throw 'failed to extract tags'
	endif
	return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
	let lines = split(a:line, "\t")
	for line in lines
		let arr = split(line, ":")
		if arr[0] == "line"
			exec arr[-1]
		endif
	endfor
	sil! norm! zvzz
endfunction

function! s:btags()
	try
		call fzf#run({'source':  s:btags_source(),
					\'down':    '~50%',
					\'options': '+m -d "\t" --with-nth 4,1',
					\'sink':    function('s:btags_sink')})
	catch
		echohl WarningMsg
		echom v:exception
		echohl None
	endtry
endfunction

command! BTags call s:btags()

" Jump to tags
function! s:tags_sink(line)
	let parts = split(a:line, '\t\zs')
	let excmd = matchstr(parts[2:], '^.*\ze;"\t')
	execute 'silent e' parts[1][:-2]
	let [magic, &magic] = [&magic, 0]
	execute excmd
	let &magic = magic
endfunction

function! s:tags()
	if empty(tagfiles())
		echohl WarningMsg
		echom 'Preparing tags'
		echohl None
		call system('ctags -R')
	endif

	call fzf#run({
				\ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
				\            '| grep -v ^!',
				\ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
				\ 'down':    '40%',
				\ 'sink':    function('s:tags_sink')})
endfunction

command! Tags call s:tags()"')

" Quickly jump by declarations list | <leader>tb
nnoremap <silent> <Leader>tb :BTags<CR>

" Select a new file | Ctrl-P
nnoremap <silent> <C-P> :FZF<CR>

" Select a buffer | <leader>b
nnoremap <silent> <Leader>b :Buffers<CR>

" Search for a tag | <leader>ta
nnoremap <silent> <Leader>ta  :Tags<CR>

