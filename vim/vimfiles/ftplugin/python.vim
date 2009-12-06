" Insert '#' after I press ENTER in insert mode
setlocal fo+=r

" text width
setlocal tw=79

setlocal comments=n:#

" Run test.py when I say :make, highlight the correct lines and enable me to
" jump to those.
set makeprg=./test.py
setlocal efm=\ \ File\ \"%f\"\\,\ line\ %l%m

" gD is normally "go to the definition of the global thing under the cursor",
" but it does not work for Python by default. With this mapping, it does.
noremap <buffer> gD ?\(def\<bar>class\) <c-r>=expand('<cword>')<cr>\><cr>

" inserting ````
nnoremap <buffer> <F3> "_yiwi`<esc>ea`<esc>
nnoremap <buffer> <S-F3> "_yiWi`<esc>Ea`<esc>
vnoremap <buffer> <F3> <esc>`>a`<esc>`<lt>i`<esc>
inoremap <buffer> <F3> ``<left>
"" nnoremap <buffer> <F4>0 "_yiwi``<esc>ea``<esc>
"" nnoremap <buffer> <S-F4>0 "_yiWi``<esc>Ea``<esc>
"" vnoremap <buffer> <F4>0 <esc>`>a``<esc>`<lt>i``<esc>
"" inoremap <buffer> <F4>0 ````<left><left>
"" nnoremap <buffer> <S-F4>* "_yiWi**<esc>Ea**<esc>
"" vnoremap <buffer> <F4>* <esc>*>a**<esc>*<lt>i**<esc>
"" inoremap <buffer> <F4>* ****<left><left>
"" nnoremap <buffer> <F4>w "_yiwi<bar><esc>ea<bar><esc>
"" nnoremap <buffer> <S-F4>w "_yiWi<bar><esc>Ea<bar><esc>
"" vnoremap <buffer> <F4>w <esc>`>a<bar><esc>`<lt>i<bar><esc>
"" inoremap <buffer> <F4>w <bar><bar><left>
" in insert mode you type: class<F3>, the result is :class:`<cursor>`
inoremap <buffer> <F2> :<esc>bi:<esc>Ea``<left>
