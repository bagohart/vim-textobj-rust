" Reload guard {{{
if &compatible || exists("g:loaded_textobj_rust")
    " finish
endif " }}}

call textobj#user#plugin('rust', {
    \   'loop': {
    \     'select-a-function': 'textobj_rust#loop_a',
	\     'select-a': '',
    \     'select-i-function': 'textobj_rust#loop_i',
	\     'select-i': '',
    \   },
    \   'while': {
    \     'select-a-function': 'textobj_rust#while_a',
	\     'select-a': '',
    \     'select-i-function': 'textobj_rust#while_i',
	\     'select-i': '',
    \   },
    \   'mod': {
    \     'select-a-function': 'textobj_rust#mod_a',
	\     'select-a': '',
    \     'select-i-function': 'textobj_rust#mod_i',
	\     'select-i': '',
    \   },
    \   'struct': {
    \     'select-a-function': 'textobj_rust#struct_a',
    \     'select-a': '',
    \     'select-i-function': 'textobj_rust#struct_i',
    \     'select-i': '',
    \   },
    \   'enum': {
    \     'select-a-function': 'textobj_rust#enum_a',
    \     'select-a': '',
    \     'select-i-function': 'textobj_rust#enum_i',
    \     'select-i': '',
    \   },
    \   'unsafe': {
    \     'select-a-function': 'textobj_rust#unsafe_a',
	\     'select-a': '',
    \     'select-i-function': 'textobj_rust#unsafe_i',
	\     'select-i': '',
    \   },
    \   'impl': {
    \     'select-a-function': 'textobj_rust#impl_a',
	\     'select-a': '',
    \     'select-i-function': 'textobj_rust#impl_i',
	\     'select-i': '',
    \   },
    \   'for': {
    \     'select-a-function': 'textobj_rust#for_a',
	\     'select-a': '',
    \     'select-i-function': 'textobj_rust#for_i',
	\     'select-i': '',
    \   },
    \   'let': {
    \     'pattern': '\v^\s*<let>[^;]*;(\s*)?$',
    \     'select': '',
    \     'scan': 'nearest',
    \   },
    \ })

let g:loaded_textobj_rust = 1

