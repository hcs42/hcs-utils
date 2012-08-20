" ---------- "
" Add a word "
" ---------- "

function! AddWord(mode)
    /^>
    normal O
    normal P
    normal A -- 
    let @* = @"
    let @+ = @"
    exec ":!chromium-browser http://www.ldoceonline.com/search/?q=" . @"
endfunction

vmap <buffer> <tab> mmy:call AddWord("visual")<cr><cr>
nmap <buffer> <tab> mmyiw:call AddWord("normal")<cr><cr>

" ----------------------- "
" Clean up the formatting "
" ----------------------- "

function! C22Cleanup()
    normal mkHml
    :%s/\t/ /ge
    :%s/ \+$//e
    :%v/^>\|^$/ s/ *:\+$//ge
    :%v/^>\|--\|^$\|^    [^ ]/ s/^ */    /e
    :%s/\%>4c  \+/ /ge
    normal `lzt`k
endfunction

noremap <buffer> ö :call C22Cleanup()<cr>

" ------------------------ "
" Format the original text "
" ------------------------ "

function! C22FormatOriginal()
    :*s/^\s\+\|\s\+$//e
    :*s/\s\s\+/ /ge
    :*s/\([.?!]'\=\) /\1\r/ge
    :*v/^--\|^$/ s/^/> /
endfunction

noremap <buffer> ü <esc>:call C22FormatOriginal()<cr>

" ----- "
" Other "
" ----- "

noremap <buffer> ó /^><cr>:nohls<cr>zz
