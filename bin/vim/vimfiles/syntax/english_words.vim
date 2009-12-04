syntax match heTitle '-----.*\n.*\n.*'
syntax match heWord '^[^ -].\{-}---'he=e-4
syntax match heExample '^    [^ ].*'

hi heTitle gui=bold
hi heWord guifg=red
hi heExample guifg=darkgray
