" blinds.nvim:		Emphasize the current window by shading the non-fucussed windows
" Last Modified: Mi 31. Okt 2018 16:45:46 +0100 CET
" Author:		Jan Christoph Ebersbach <jceb@e-jc.de>
" Version:		0.2

if (exists("g:loaded_blinds") && g:loaded_blinds) || &cp
    finish
endif
let g:loaded_blinds= 1

if !exists("g:blinds_guibg")
    let g:blinds_guibg = "#969694"
endif

function! s:SetBlinds()
    exec "hi Blinds guibg=".g:blinds_guibg
endfun

augroup blinds
    au!
    au WinEnter,BufEnter * setlocal winhighlight=
    au WinLeave * setlocal winhighlight=ColorColumn:Blinds,CursorColumn:Blinds,CursorLine:Blinds,EndOfBuffer:Blinds,LineNr:Blinds,NonText:Blinds,Normal:Blinds,FoldColumn:Blinds,SignColumn:Blinds,VertSplit:Blinds,Whitespace:Blinds
    au ColorScheme * call s:SetBlinds()
augroup END

call s:SetBlinds()
