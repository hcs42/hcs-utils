" Vim syntax file for Wikipedia with C++ (and other MediaWiki sites)
" * enhanced with folding for sections
" Written by Attila Nagy, 2006
" Completed by Csaba Hoch, 2006
" 
" Known problems:
" * italic and bold texts are always black
" ** fixed for section headers, where they were most annoying (isn't there a
" better way?)

syn clear
"hi clear -- why?

"syn match wpcBasicText "[^]'\[^=]\+" transparent contains=@Spell
syn match wpcBasicText "[^']\[^=<]\+" transparent contains=@Spell
syn region wpcHtml start="<..\{-}>" end="</..\{-}>"
syn match wpcBoldText "'''[^]'\[^=]\+'''" contains=@Spell
syn match wpcVText "`[^`]*`" contains=@Spell
syn match wpcItalicText "''[^]'\[^=]\+''" contains=@Spell
syn cluster wpcFormattedText contains=wpcBasicText,wpcBoldText,wpcItalicText,wpcVText
syn region wpcLink start="\[\[" end="\]\]" contains=@wpcFormattedText oneline
syn cluster wpcWikiText contains=@wpcFormattedText,wpcLink
syn match wpcBoldTextH "'''[^]'\[^=]\+'''" contained
syn match wpcItalicTextH "''[^]'\[^=]\+''" contained
syn cluster wpcFormattedTextH contains=wpcBasicText,wpcBoldTextH,wpcItalicTextH 
syn region wpcLinkH start="\[\[" end="\]\]" contains=@wpcFormattedTextH oneline
syn cluster wpcWikiTextH contains=@wpcFormattedTextH,wpcLinkH
syn region wpcNoWiki start="<nowiki>" end="</nowiki>"
syn region wpcCode matchgroup=wpTagCode start=/<code>/ end=/<\/code>/ contains=@wpcCPlusPlus
syn region wpcCodeRegion start=/^ / end=/$/ contains=@wpcText
syn cluster wpcText contains=@wpcWikiText,wpcNoWiki,wpcHtml,wpcCppRegion,wpcCode,wpcCodeRegion
syn cluster wpcTextH contains=@wpcWikiTextH,wpcNoWiki,wpcHtml,wpcCppRegion,wpcCode,wpcCodeRegion
syn match wpcListLine "^[\*#]\+.\+$" contains=@wpcText
syn region wpcHeader start="^==" end="==\s*$" contains=@wpcTextH oneline
syn cluster wpcBodyElements contains=@wpcText,wpcListLine,wpcHeader
syn region wpcH2 start="^==[^=]*==\s*$" end="==[^=]*==\s*$\&^"me=e-1 contains=@wpcBodyElements,wpcH3 fold keepend
syn region wpcH3 start="^===[^=]*===\s*$" end="===[^=]*===\s*$\&^"me=e-1 contains=@wpcBodyElements,wpcH4 fold keepend contained
syn region wpcH4 start="^====[^=]*====\s*$" end="====[^=]*====\s*$\&^"me=e-1 contains=@wpcBodyElements,wpcH5 fold keepend contained
syn region wpcH5 start="^=====[^=]*=====\s*$" end="=====[^=]*=====\s*$\&^"me=e-1 contains=@wpcBodyElements fold keepend contained
"contained is in the 3 sections, because in this case the user will notice
"easier the one-space-containing empty lines after the C++-code sections

hi wpcHeader guifg=blue ctermfg=blue
hi wpcHtml guifg=darkgreen ctermfg=blue
"hi wpcCode guifg=darkgreen ctermfg=blue
hi wpcLink guifg=darkgreen ctermfg=green
hi wpcItalicText gui=italic guifg=NONE ctermfg=yellow
hi wpcBoldText gui=bold guifg=NONE cterm=bold ctermfg=NONE
hi wpcVText guifg=darkgray cterm=bold ctermfg=NONE
hi wpcItalicTextH gui=italic guifg=blue ctermfg=yellow
hi wpcBoldTextH gui=bold guifg=blue cterm=bold ctermfg=blue
hi wpcBoldTextH gui=bold guifg=blue cterm=bold ctermfg=blue
hi wpTagCode    guifg=darkgreen ctermfg=green
"hi wpcBasicText    guifg=green ctermfg=green
hi wpcCodeRegion    guifg=#888888 ctermfg=green


set foldmethod=syntax
set linebreak

