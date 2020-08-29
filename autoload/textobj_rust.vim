
function! textobj_rust#loop_a()  " {{{
    return textobj_rust#select_a('loop')
endfunction " }}}

function! textobj_rust#loop_i()  " {{{
    return textobj_rust#select_i('loop')
endfunction " }}}

function! textobj_rust#while_a()  " {{{
    return textobj_rust#select_a('while')
endfunction " }}}

function! textobj_rust#while_i()  " {{{
    return textobj_rust#select_i('while')
endfunction " }}}

function! textobj_rust#mod_a()  " {{{
    return textobj_rust#select_a('mod')
endfunction " }}}

function! textobj_rust#mod_i()  " {{{
    return textobj_rust#select_i('mod')
endfunction " }}}

function! textobj_rust#for_a()  " {{{
    return textobj_rust#select_a('for')
endfunction " }}}

function! textobj_rust#for_i()  " {{{
    return textobj_rust#select_i('for')
endfunction " }}}

function! textobj_rust#struct_a()  " {{{
    return textobj_rust#select_a('struct')
endfunction " }}}

function! textobj_rust#struct_i()  " {{{
    return textobj_rust#select_i('struct')
endfunction " }}}

function! textobj_rust#enum_a()  " {{{
    return textobj_rust#select_a('enum')
endfunction " }}}

function! textobj_rust#enum_i()  " {{{
    return textobj_rust#select_i('enum')
endfunction " }}}

function! textobj_rust#impl_a()  " {{{
    return textobj_rust#select_a('impl')
endfunction " }}}

function! textobj_rust#impl_i()  " {{{
    return textobj_rust#select_i('impl')
endfunction " }}}

function! textobj_rust#unsafe_a()  " {{{
    return textobj_rust#select_a('unsafe')
endfunction " }}}

function! textobj_rust#unsafe_i()  " {{{
    return textobj_rust#select_i('unsafe')
endfunction " }}}

function! textobj_rust#select_i(keyword) " {{{
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
endfunction " }}}

function! textobj_rust#select_a(keyword) " {{{
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
endfunction " }}}
