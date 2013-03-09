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
    let l:a = @"
    let @" = substitute(@", ' ', '\\%20', 'g')
    if Contains(g:c22_lookups, 'wp')
        exec ":!chromium-browser http://en.wikipedia.org/w/index.php?search=" . @"
    endif
    if Contains(g:c22_lookups, 'longman')
        exec ":!chromium-browser http://www.ldoceonline.com/search/?q=" . @"
    endif
    set hls
    let @* = l:a
    let @+ = l:a
    let @/ = l:a
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

function! C22MultiMeaning()
    let l:start_line = line("'<")
    let l:end_line = line("'>")
    echo l:start_line . ' ' . l:end_line
    let l:current_line = start_line
    let l:definitions = ''
    let l:examples = ''
    let l:new_def = 0
    let l:first = 1

    while l:current_line <= l:end_line
        let l:line = getline(l:current_line)

        " Handle the case where the first line contains the left side as well,
        " for example:
        "     dog -- 1 a well-known animal
        if l:first
            let l:first = 0
            let l:ml = matchlist(l:line, '^\(.\{-}\) -- \(.*\)$')
            if l:ml != []
                let l:definitions = l:ml[1] . ' -- '
                let l:line = l:ml[2]
            endif
        endif

        " Remove starting white space
        let l:line = substitute(l:line, '^\s\+', '', 'g')
        let l:maybe_def_index = matchstr(l:line, '^\d\s\@=')
        
        if l:maybe_def_index != ''
            " New definition.
            " Example:
            "   2 to give someone advice, an explanation etc
            let l:def_index = l:maybe_def_index
            let l:line = substitute(l:line, '^\(\d\)\s\+', '(\1) ', 'g')
            if l:def_index != 1
                let l:definitions .= ' '
            endif
            let l:definitions .= l:line
            let l:new_def = 1
        else
            let l:examples .= '    '
            if l:new_def
                let l:examples .= '(' . l:def_index . ') '
                let l:new_def = 0
            endif
            let l:examples .= l:line . "\n"
        endif

        let l:current_line += 1
    endwhile

    *delete
    let @x = l:definitions . "\n" . l:examples
    put! x
    
endfunction

noremap <buffer> ű :call C22MultiMeaning()<cr>
vnoremap <buffer> ű <esc>:call C22MultiMeaning()<cr>

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
map Ű 0f,xxv/--<cr>hhdo    # <c-r>"<esc>k0:noh<cr>
