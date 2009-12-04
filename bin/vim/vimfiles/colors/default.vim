" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "default"

hi Folded                       guifg=darkblue  guibg=#ffffff
hi SpellErrors                  guifg=red       ctermfg=red
"hi Error                        guifg=black     guibg=white

" Status Line colors
hi hcsSLFileName guifg=yellow guibg=darkgray
hi hcsSLFileNameMod guifg=green guibg=darkgray gui=bold
hi hcsSLBufferNumber guifg=red guibg=black
hi hcsSLWindowNumber guifg=blue guibg=black
hi hcsSLFileLineNumber guifg=yellow guibg=black
hi hcsSLLineColNumber guifg=white guibg=black