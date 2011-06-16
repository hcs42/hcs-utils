" Highlighing long lines:
command! Match70On let w:m1=matchadd('ErrorMsg','\%72v.*',-1)
command! Match70Off call matchdelete(w:m1)
command! Match80On let w:m1=matchadd('Search','\%<82v.\%>71v',-1) | :let w:m2=matchadd('ErrorMsg','\%82v.*',-1)
command! Match80Off call matchdelete(w:m1) | call matchdelete(w:m2)


