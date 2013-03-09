syntax match C22Error /./
hi link C22Error Error
syntax match C22Quote /^>.*/
hi C22Quote guibg=white
syntax match C22Wordpair /^[^[:blank:]-].* -- .*/
hi C22Wordpair guibg=#ccffcc guifg=darkgreen
syntax match C22Number /^-- .* --$/
hi C22Number guibg=cyan guifg=red gui=bold
syntax match C22Meta /^---.*$/
hi C22Meta guifg=purple
syntax match C22Example /^    .*$/
hi C22Example guibg=white guifg=darkgreen
