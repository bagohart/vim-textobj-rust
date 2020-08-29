# vim-textobj-rust
This vim plugin provides text objects for [Rust programming](https://www.rust-lang.org/).

## Installation
Install with your favourite package manager or Vim's built-in package management system.
For example using Vim-Plug:
```
Plug 'bagohart/vim-textobj-rust'
```

## Configuration
This plugin does not define any mappings.
I use the following mappings (in `ftplugin/rust.vim`):

```
" Mappings for textobj-rust {{{
omap <buffer> irlo <Plug>(textobj-rust-loop-i)
xmap <buffer> irlo <Plug>(textobj-rust-loop-i)
omap <buffer> arlo <Plug>(textobj-rust-loop-a)
xmap <buffer> arlo <Plug>(textobj-rust-loop-a)

omap <buffer> irm <Plug>(textobj-rust-mod-i)
xmap <buffer> irm <Plug>(textobj-rust-mod-i)
omap <buffer> arm <Plug>(textobj-rust-mod-a)
xmap <buffer> arm <Plug>(textobj-rust-mod-a)

omap <buffer> irs <Plug>(textobj-rust-struct-i)
xmap <buffer> irs <Plug>(textobj-rust-struct-i)
omap <buffer> ars <Plug>(textobj-rust-struct-a)
xmap <buffer> ars <Plug>(textobj-rust-struct-a)

omap <buffer> ire <Plug>(textobj-rust-enum-i)
xmap <buffer> ire <Plug>(textobj-rust-enum-i)
omap <buffer> are <Plug>(textobj-rust-enum-a)
xmap <buffer> are <Plug>(textobj-rust-enum-a)

omap <buffer> irf <Plug>(textobj-rust-for-i)
xmap <buffer> irf <Plug>(textobj-rust-for-i)
omap <buffer> arf <Plug>(textobj-rust-for-a)
xmap <buffer> arf <Plug>(textobj-rust-for-a)

omap <buffer> irw <Plug>(textobj-rust-while-i)
xmap <buffer> irw <Plug>(textobj-rust-while-i)
omap <buffer> arw <Plug>(textobj-rust-while-a)
xmap <buffer> arw <Plug>(textobj-rust-while-a)

omap <buffer> iri <Plug>(textobj-rust-impl-i)
xmap <buffer> iri <Plug>(textobj-rust-impl-i)
omap <buffer> ari <Plug>(textobj-rust-impl-a)
xmap <buffer> ari <Plug>(textobj-rust-impl-a)

omap <buffer> iru <Plug>(textobj-rust-unsafe-i)
xmap <buffer> iru <Plug>(textobj-rust-unsafe-i)
omap <buffer> aru <Plug>(textobj-rust-unsafe-a)
xmap <buffer> aru <Plug>(textobj-rust-unsafe-a)

omap <buffer> irle <Plug>(textobj-rust-let)
xmap <buffer> irle <Plug>(textobj-rust-let)
omap <buffer> arle <Plug>(textobj-rust-let)
xmap <buffer> arle <Plug>(textobj-rust-let)
" }}}
```

## Requirements
Depends on [vim-textobj-user](https://github.com/kana/vim-textobj-user).\
Developed and tested on Neovim 0.4.3, but it should work on Vim 8, too.

## Bugs
The text objects in this plugin do not invoke RLS, they are hacked together with simple regular expressions and a bit of Vimscript. They are implemented in a rather naive way, so fooling them is easy.
For instance, `<Plug>(textobj-rust-let)` will not select the statement 
```
let x = String::from("aha; hm");
```
correctly.
The text objects also assume that your code is formatted with [rustfmt](https://github.com/rust-lang/rustfmt).

## License
The Vim licence applies. See `:help license`.
