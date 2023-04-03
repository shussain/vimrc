" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont Monospace:h10
endif

if exists(':GuiPopupmenu')
    GuiPopupmenu 1
endif

" allow copy/cut/paste context menu
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

" Resize screen
"noremap <kPlus> :execute "GuiFont Monospace:h22"<CR>
"noremap <kMinus> :execute "GuiFont Monospace:h10"<CR>

let s:fontsize = 12
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Monospace:h" . s:fontsize
endfunction

" In normal mode, pressing numpad's+ increases the font
noremap <kPlus> :call AdjustFontSize(6)<CR>
noremap <kMinus> :call AdjustFontSize(-6)<CR>

" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-kPlus> <Esc>:call AdjustFontSize(6)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-6)<CR>a

