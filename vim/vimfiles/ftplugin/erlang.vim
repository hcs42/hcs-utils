" Vim filetype plugin file
" Language:	
" Maintainer:	Csaba Hoch <csaba.hoch@gmail.com>
" Last Change:	2007 Mar 22

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql
setlocal comments=n:%
setlocal tw=80

" Mappings
noremap <buffer> gD /^<c-r>=expand('<cword>')<cr>\><cr>
noremap <buffer> <F1> :exec "lcd ".expand('%:p:h')<cr>:make <bar> cw<cr>

" Features:
" - F2: print this line
" - F3: print this variable
" - ,F2: print this line to file
" - ,F3: print this variable to file
" - uniform format: XXXXXXXX user: mod:fun+line <process> var=value
" - remembers screen and cursor position
" - indents the new line automatically
" Used registers:
" - j, k: cursor positision
" - l: function name
" - h: variable name
noremap <buffer> <F2> mjHmk`j?^[a-z][A-Za-z0-9_]*(<CR>"lyw<C-O>O<ESC>Diio:format("XXXXXXXX <c-r>=$USER<cr>: ~p:<C-r>l+~p <lt>~p>~n", [?MODULE, ?LINE, self()]),<ESC>==:noh<CR>`kzt`j
noremap <buffer> <F3> "hyiwmjHmk`j?^[a-z][A-Za-z0-9_]*(<CR>"lyw<C-O>o<ESC>Diio:format("XXXXXXXX <c-r>=$USER<cr>: ~p:<C-r>l+~p <~p>~n<C-r>h=~p~n", [?MODULE, ?LINE, self(), <C-r>h]),<ESC>==:noh<CR>`kzt`j
noremap <buffer> ,<F2> mjHmk`j?^[a-z][A-Za-z0-9_]*(<CR>"lyw<C-O>O<ESC>Di(fun() -> {ok,I}=file:open("<c-r>=$USER<cr>.vimout",[append]),io:format(I,"XXXXXXXX <c-r>=$USER<cr>: ~p:<C-r>l+~p <lt>~p>~n", [?MODULE, ?LINE, self()]),file:close(I) end)(),<ESC>==:noh<CR>`kzt`j
noremap <buffer> ,<F3> "hyiwmjHmk`j?^[a-z][A-Za-z0-9_]*(<CR>"lyw<C-O>o<ESC>Di(fun() -> {ok,I}=file:open("<c-r>=$USER<cr>.vimout",[append]),io:format(I,"XXXXXXXX <c-r>=$USER<cr>: ~p:<C-r>l+~p <~p>~n<C-r>h=~p~n", [?MODULE, ?LINE, self(), <C-r>h]),file:close(I) end)(),<ESC>==:noh<CR>`kzt`j
