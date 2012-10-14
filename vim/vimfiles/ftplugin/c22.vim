" ---------- "
" Add a word "
" ---------- "

function! Contains(list, item)
    return index(a:list, a:item) != -1
endfunction

let g:c22_lookups = ['longman']
let g:c22_all_lookups = ['longman', 'wp']

function! LookupAdd(item)
    if Contains(g:c22_all_lookups, a:item)
        call add(g:c22_lookups, a:item)
    else
        echo "The given item is not a lookup item!"
    endif
endfunction

function! LookupDel(item)
    call remove(g:c22_lookups, index(g:c22_lookups, a:item))
endfunction

command! -nargs=0 LookupShow echo g:c22_lookups
command! -nargs=0 LookupShowAll echo g:c22_all_lookups
command! -nargs=1 LookupAdd call LookupAdd('<args>')
command! -nargs=1 LookupDel call LookupDel('<args>')
command! -nargs=0 LookupAddAll let g:c22_lookups = g:c22_all_lookups
command! -nargs=0 LookupDelAll let g:c22_lookups = []

noremap Ő :LookupShow<cr>
noremap Ú :LookupShowAll<cr>
noremap őő :LookupAddAll<cr>
noremap úú :LookupDelAll<cr>
noremap őw :LookupAdd wp<cr>
noremap úw :LookupDel wp<cr>
noremap ől :LookupAdd longman<cr>
noremap úl :LookupDel longman<cr>

function! AddWord(mode)
    " If we are in the last line of the text, add an extra line
    if line('.') == line('$')
        call append('$', '')
    endif

    /^\(>\|$\)
    normal O
    normal P
    normal A -- 
    let @* = @"
    let @+ = @"
    let @/ = @"
    let @" = substitute(@", ' ', '\\%20', 'g')
    if Contains(g:c22_lookups, 'wp')
        exec ":!chromium-browser http://en.wikipedia.org/w/index.php?search=" . @"
    endif
    if Contains(g:c22_lookups, 'longman')
        exec ":!chromium-browser http://www.ldoceonline.com/search/?q=" . @"
    endif
    set hls
endfunction

vmap <buffer> <tab> mmy:call AddWord("visual")<cr><cr>:set hls<cr><cr>
nmap <buffer> <tab> mmyiw:call AddWord("normal")<cr><cr>:set hls<cr><cr>

" ----------------------- "
" Clean up the formatting "
" ----------------------- "

function! C22Cleanup()
    normal mkHml
    :%s/\t/ /ge
    :%s/[•‧]//ge
    :%s/ \+$//e
    :%v/^>\|^$/ s/ *:\+$//ge
    :%v/^>\|--\|^$\|^    [^ ]/ s/^ */    /e
    :%s/\%>4c  \+/ /ge
    normal `lzt`k
endfunction

noremap <buffer> ö :call C22Cleanup()<cr>
noremap <buffer> á ?\<\(.*\) -- .*\1.*<cr>

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
setlocal tw=999
