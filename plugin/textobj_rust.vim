" Reload guard {{{
if &compatible || exists("g:loaded_textobj_rust")
    " finish
endif " }}}


	call textobj#user#plugin('line', {
	\   '-': {
	\     'select-a-function': 'CurrentLineA',
	\     'select-a': '',
	\     'select-i-function': 'CurrentLineI',
	\     'select-i': '',
	\   },
	\ })

	function! CurrentLineA()
	  normal! 0
	  let head_pos = getpos('.')
	  normal! $
	  let tail_pos = getpos('.')
	  return ['v', head_pos, tail_pos]
	endfunction

	function! CurrentLineI()
	  normal! ^
	  let head_pos = getpos('.')
	  normal! g_
	  let tail_pos = getpos('.')
	  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
	  return
	  \ non_blank_char_exists_p
	  \ ? ['v', head_pos, tail_pos]
	  \ : 0
	endfunction


call textobj#user#plugin('rust', {
    \   'loop': {
    \     'select-a-function': 'LoopA',
	\     'select-a': '',
    \     'select-i-function': 'LoopI',
	\     'select-i': '',
    \   },
    \   'while': {
    \     'select-a-function': 'WhileA',
	\     'select-a': '',
    \     'select-i-function': 'WhileI',
	\     'select-i': '',
    \   },
    \ })

" todo: try to autoload all the functions

function! LoopA()  " {{{
    echom "called LoopA"
    return Select_a('loop')
endfunction " }}}

function! LoopI()  " {{{
    echom "called LoopI"
    return Select_i('loop')
endfunction " }}}

function! WhileA()  " {{{
    return Select_a('while')
endfunction " }}}

function! WhileI()  " {{{
    return Select_i('while')
endfunction " }}}

function! Select_i(keyword)
    " assume that we are in the construct or on the line that contains the 'keyword'
    normal! $
    redraw
    let match = search('\v<' . a:keyword . '>', 'cbeW')
    if 0 == match
        return 0
    endif
    execute 'normal! /\V{' . "\<CR>"
    let open_br = getpos('.')
    normal! %
    let closing_br = getpos('.')
    call setpos('.', open_br)
    normal! j0
    let start_pos = getpos('.')
    call setpos('.', closing_br)
    normal! k0
    let end_pos = getpos('.')
    if 0 <= end_pos[1] - start_pos[1]  " is there some code?
        return ['V', start_pos, end_pos]
    else
        return 0
    endif
endfunction

function! Select_a(keyword)
    " assume that we are in the construct or on the line that contains the 'keyword'
    normal! $
    let match = search('\v<' . a:keyword . '>', 'beWc')
    if 0 == match
        return 0
    endif
    let keyword_pos = getpos('.')

    execute 'normal! /\V{' . "\<CR>"
    let open_br = getpos('.')
    normal! %
    let closing_br = getpos('.')
    call setpos('.', keyword_pos)
    normal! ^
    let start_pos = getpos('.')
    call setpos('.', closing_br)
    normal! $
    let end_pos = getpos('.')
    return ['V', start_pos, end_pos]
endfunction
let g:loaded_textobj_rust = 1
