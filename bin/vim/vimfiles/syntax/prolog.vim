syntax clear

syn match prologPredicate  /[a-záéíóöõúüû][0-9a-zA-ZáéíóöõúüûÁÉÍÓÖÕÚÜÛ_]*/ contained
syn match prologPredicateInside  /[a-záéíóöõúüû][0-9a-zA-ZáéíóöõúüûÁÉÍÓÖÕÚÜÛ_]*/ contained
syn match prologVar        /[A-ZÁÉÍÓÖÕÚÜÛ_][0-9a-zA-ZáéíóöõúüûÁÉÍÓÖÕÚÜÛ_]*/ contained
syn match prologImp        /:-/ contained
syn region prologClauseEnd start=/:-/ end=/\./ contained contains=prologImp,prologVar,prologPredicateInside,prologString1,prologString2,prologString3,prologComment,prologList

syn region prologClause start=/[a-zA-ZáéíóöõúüûÁÉÍÓÖÕÚÜÛ_]/ end=/\./ contains=prologPredicate,prologVar,prologClauseEnd,prologString1,prologString2,prologString3,prologComment,prologList
syn region prologString1	start=/"/ skip=/\\"/ end=/"/
syn region prologString2	start=/'/ end=/'/
syn match  prologString3	/0'./
syn region prologComment	start=/%/ end=/$/
syn region prologList           matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/\]/ contains=prologList,prologComment,prologVar,prologString1,prologString2,prologString3

hi link prologString1 String
hi link prologString2 String
hi link prologString3 String
hi prologPredicateInside  guifg=#606060
hi prologPredicate guifg=#0000ff
hi link prologVar Identifier
hi prologImp guifg=#ff00ff gui=bold
hi prologComment guifg=#e40000
"hi link prologList Special


