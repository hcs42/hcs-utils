" vim:fenc=utf-8

" ------------- "
" Some digraphs "
" ------------- "

" "o/"  ø    "=="  ⇔    "Ob"  ∘    "!="  ≠
" "j3"  ϵ    "FA"  ∀    "Sb"  ∙    "=3"  ≡
" "5r"  ⅴ    "dP"  ∂    "RT"  √    "=<"  ≤
" "ar"  ⅹ    "TE"  ∃    "0("  ∝    ">="  ≥
" "<-"  ←    "0/"  ∅    "00"  ∞    "<*"  ≪
" "-!"  ↑    "DE"  ∆    "-L"  ∟    "*>"  ≫
" "->"  →    "NB"  ∇    "-V"  ∠    "!<"  ≮
" "-v"  ↓    "(-"  ∈    "PP"  ∥    "!>"  ≯
" "<>"  ↔    "-)"  ∋    "AN"  ∧    "(C"  ⊂
" "UD"  ↕    "*P"  ∏    "OR"  ∨    ")C"  ⊃
" "<="  ⇐    "+Z"  ∑    "(U"  ∩    "(_"  ⊆
" "=>"  ⇒    "*-"  ∗    ")U"  ∪    ")_"  ⊇

" -------- "
" Mappings "
" -------- "

noremap é :USE_THE_LAPTOP_LUKE!<space>
noremap ú <c-^>
noremap ű <c-]>

" ------------------- "
" Converter functions "
" ------------------- "

function! HLatin1()
    silent! %s/ő/ô/g
    silent! %s/ű/û/g
    silent! %s/Ő/Ô/g
    silent! %s/Ű/Û/g
endfunction

command! HLatin1 call HLatin1()

function! HNoAccent()
    silent! *s/\%Vá/a/g
    silent! *s/\%Vé/e/g
    silent! *s/\%Ví/i/g
    silent! *s/\%Vó/o/g
    silent! *s/\%Vö/o/g
    silent! *s/\%Vő/o/g
    silent! *s/\%Vú/u/g
    silent! *s/\%Vü/u/g
    silent! *s/\%Vű/u/g
    silent! *s/\%VÁ/A/g
    silent! *s/\%VÉ/E/g
    silent! *s/\%VÍ/I/g
    silent! *s/\%VÓ/O/g
    silent! *s/\%VÖ/O/g
    silent! *s/\%VŐ/O/g
    silent! *s/\%VÚ/U/g
    silent! *s/\%VÜ/U/g
    silent! *s/\%VŰ/U/g
endfunction

command! HNoAccent call HNoAccent()

function! EoDoAccent()
    silent! %s/cx/ĉ/g
    silent! %s/gx/ĝ/g
    silent! %s/hx/ĥ/g
    silent! %s/jx/ĵ/g
    silent! %s/sx/ŝ/g
    silent! %s/ux/ŭ/g
    silent! %s/Cx/Ĉ/g
    silent! %s/Gx/Ĝ/g
    silent! %s/Hx/Ĥ/g
    silent! %s/Jx/Ĵ/g
    silent! %s/Sx/Ŝ/g
endfunction

function! EoRemoveAccent()
    silent! %s/ĉ/cx/g
    silent! %s/ĝ/gx/g
    silent! %s/ĥ/hx/g
    silent! %s/ĵ/jx/g
    silent! %s/ŝ/sx/g
    silent! %s/ŭ/ux/g
    silent! %s/Ĉ/Cx/g
    silent! %s/Ĝ/Gx/g
    silent! %s/Ĥ/Hx/g
    silent! %s/Ĵ/Jx/g
    silent! %s/Ŝ/Sx/g
endfunction
