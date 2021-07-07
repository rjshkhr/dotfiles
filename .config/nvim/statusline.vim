hi User1 ctermfg=none ctermbg=0 cterm=BOLD
hi User2 ctermfg=1 ctermbg=none
hi User3 ctermfg=NONE ctermbg=1 cterm=BOLD
hi User4 ctermfg=1 ctermbg=0
hi User5 ctermfg=5 ctermbg=none
hi User6 ctermfg=NONE ctermbg=5 cterm=BOLD
hi User7 ctermfg=0 ctermbg=none
hi User8 ctermfg=5 ctermbg=0
hi User9 ctermfg=none ctermbg=none cterm=BOLD

set statusline=
set statusline+=%2*%3*%f%4*
set statusline+=\ %1*\ %1*%{mode()}
set statusline+=%1*\ %m%7*
set statusline+=%9*%=
set statusline+=\ %7*%1*\ %v:%l\/%L
set statusline+=\ %8*%6*\ %Y\ %5*
