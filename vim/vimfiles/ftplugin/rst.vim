"text width
setlocal tw=79

" make
setlocal makeprg=make\ html

" inserting ````
nnoremap <buffer> <F2> "_yiwi``<esc>ea``<esc>
vnoremap <buffer> <F2> <esc>`>a``<esc>`<lt>i``<esc>
inoremap <buffer> <F2> ````<left><left>
inoremap <buffer> <F3> ``<left>
" in insert mode you type: class<F3>, the result is :class:`<cursor>`
"inoremap <buffer> <F3> :<esc>bi:<esc>Ea``<left>
