" blinds.nvim:		Emphasize the current window by shading the non-fucussed windows
" Last Modified: Sat 23. Sep 2017 17:20:31 +0200 CEST
" Author:		Jan Christoph Ebersbach <jceb@e-jc.de>
" Version:		0.1

if (exists("g:loaded_blinds") && g:loaded_blinds) || &cp
    finish
endif
let g:loaded_blinds= 1

if !hlexists("Blinds")
    hi Blinds guibg=#969694
endif

augroup blinds
    au!
    au WinEnter,BufEnter * setlocal winhighlight=
    au WinLeave * setlocal winhighlight=Normal:Blinds,EndOfBuffer:Blinds,CursorColumn:Blinds,CursorLine:Blinds,ColorColumn:Blinds
augroup END
