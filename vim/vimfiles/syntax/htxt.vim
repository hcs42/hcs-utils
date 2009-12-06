syntax region hcsHeaderA1 start='^---*$' end='^---*$'
hi hcsHeaderA1 guifg=red ctermfg=red 
syntax match hcsEq '=\{4,}'
hi hcsEq guifg=purple

"syntax match hcsHeaderB1 '\%(^[ <]\)\@<=[^ ].*' contains=ALL
"syntax match hcsHeaderB2 '\%(^[ <] \)\@<=[^ <].*' contains=ALL
"syntax match hcsHeaderB3 '\%(^[ <]  \)\@<=[^ <].*' contains=ALL

syntax region hcsHeaderB1 start='^[ <][^ <]'ms=s+1 end='$' end=':' contains=ALL
hi hcsHeaderB1 guifg=blue gui=underline ctermfg=blue
syntax region hcsHeaderB2 start='^[ <] [^ <]'ms=s+2 end='$' end=':' contains=ALL
hi hcsHeaderB2 guifg=darkgreen ctermfg=darkgreen
syntax region hcsHeaderB3 start='^[ <]  [^ <]'ms=s+3 end='$' end=':' contains=ALL
hi hcsHeaderB3 guifg=brown ctermfg=brown

syntax region hcsColor1 start='{' end='}' contains=ALL
syntax match hcsFoldBegin '{{{'
hi link hcsColor1 Special
syntax region hcsColor2 start='\[' end='\]' contains=ALL
hi hcsColor2 guifg=darkblue ctermfg=darkblue 

syn region hcsCode	matchgroup=Ignore start=" >$" start="^>$" end='^[^ \t]'me=e-1 end='^ [^ \t]'me=e-2 end='^  [^ \t]'me=e-3 end='^   [^ \t]'me=e-4 end='^<' contains=@NoSpell
"hi hcsCode guifg=darkgray ctermfg=darkgrey

"syn include @htxtSh syntax/erlang.vim
"syn region hcsCodeSh	matchgroup=Ignore start=" sh>$" start="^sh>$" end='^[^ \t]'me=e-1 end='^ [^ \t]'me=e-2 end='^  [^ \t]'me=e-3 end='^   [^ \t]'me=e-4 end='^<' contains=@htxtSh,@NoSpell
syn include @htxtErlang syntax/erlang.vim
syn region hcsCodeErlang	matchgroup=Ignore start=" erlang>$" start="^erlang>$" end='^[^ \t]'me=e-1 end='^ [^ \t]'me=e-2 end='^  [^ \t]'me=e-3 end='^   [^ \t]'me=e-4 end='^<' contains=@htxtErlang,@NoSpell

syn region hcsNosyntax	matchgroup=Ignore start="^|" end='$'
"hi hcs guifg=darkgray ctermfg=darkgrey

syntax region hcsVim start="---vim---" end="\%$"
hi link hcsVim Ignore



