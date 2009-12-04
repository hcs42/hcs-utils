
syn match galaktikaError /[^\[\t]/
syn match galaktikaJegy1 /1/ contained
syn match galaktikaJegy2 /2/ contained
syn match galaktikaJegy3 /3/ contained
syn match galaktikaJegy4 /4/ contained
syn match galaktikaJegy5 /5/ contained
syn match galaktikaJegy /^    [1-5] / contained contains=galaktikaJegy1,galaktikaJegy2,galaktikaJegy3,galaktikaJegy4,galaktikaJegy5
syn match galaktikaSzamSzam /^\[[0-9]\{3}\]/ contained
syn match galaktikaKesz / [X0-9!]\+$/ contained
syn match galaktikaTema /\( \[.\{-1,}\]\)\=\( [X0-9!]\+\)\=$/hs=s+1 contained contains=galaktikaHianyzik,galaktikaKesz
syn match galaktikaHianyzik /\[hiányzik\]/ contained
syn region galaktikaSzam start=/^\[[0-9]\{3}\]/ end=/^\[[0-9]\{3}\]/me=s-1 fold contains=galaktikaJegy,galaktikaSzamSzam,galaktikaHianyzik,galaktikaTema
",galaktikaKesz

hi link galaktikaError hcsSuper3CommentInside
hi link galaktikaHianyzik hcsSuper4CommentInside
hi galaktikaJegy1 guifg=#3f0000 gui=underline
hi galaktikaJegy2 guifg=#6f0000 gui=underline
hi galaktikaJegy3 guifg=#9f0000 gui=underline
hi galaktikaJegy4 guifg=#cf0000 gui=underline
hi galaktikaJegy5 guifg=#ff0000 gui=underline,bold
hi link galaktikaSzamSzam hcsSuper3CommentInside
hi link galaktikaTema hcsSuper2Comment
hi galaktikaKesz guifg=#ff00ff gui=bold

syntax sync fromstart

setlocal foldmethod=syntax

