" Simplified vimrc for use when using an older instance of vim or
" where there are no vim plugins

source $HOME/_vimrc-plugin
source $HOME/_vimrc-linux

set nocompatible

" Initial restarting
"autocmd!

set showmode
set showcmd

" Formatting
set encoding=utf-8
set ruler
set title

set number
" Show the line number relative to the line with the cursor in front of each line
set relativenumber

" Keep cursor away from edges of screen.
set so=3

" Autocomplete for file entry
set wim=list:longest,full

" Autocomplete for Ctrl-N and Ctrl-P. We are looking at open/hidden buffers
" and tags
set complete=.,b,u,t

" Ignore cases for searching
set ignorecase
set smartcase

" Show the first match for the pattern, while typing it
set incsearch

" Highlight all search matches
set hlsearch

" Set visual bell instead of beep.
" Good when not wearing earphone at work
set visualbell

" No backup thanks to source control but might change this later
set nobackup

" Set paste (for copy-paste). In terminal, it works. In GUI,
" it automatically gets disabled
set paste

" When encrypting any file, use the much stronger blowfish algorithm
if has("cryptmethod")
    set cryptmethod=blowfish
endif

set spell spelllang=en_ca

set clipboard^=unnamedplus,unnamed


" Wrapping & column stuff
set wrapmargin=8
set nowrap "columns=80 lines=30

" Tabbing insanity. All of the below is to have 4 spaces added when TAB is hit
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab

" Place a line at 80 columns to visibly mark the point where most code should
" end or be wrapped
set colorcolumn=80
"highlight colorcolumn ctermbg=233

" Remap Caps lock to be escape
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Deal with going up and down with long line
:nnoremap k gk
:nnoremap j gj

" Spelling changes. Fix common typos and mistakes I make
abbreviate adn and
abbreviate eg e.g.
abbreviate etc etc.
abbreviate teh the
abbreviate thier their
abbreviate woudl would
abbreviate definately definitely
abbreviate Phillipinne Philippine
abbreviate Phillipine Philippine
abbreviate Philipinne Philippine

" Set the global map leader variable so that:
:let mapleader = ","

" Remap semicolon to map (for Ex commands) since colon is important
" NOTE TO SELF: ; is used to repeat last motion so it may be useful
nnoremap ; :

" Make it easy to update/reload _vimrc
:nmap <Leader>s :source $HOME/_vimrc<CR>
:nmap <Leader>v :NERDTree $HOME/dot-files/vimrc/<CR>

" Have the tabbed editing work with internet browser type functionality
" You just use comma instead of CTRL
:nmap <Leader>t <Esc>:tabnew<CR>
:nmap <Leader>w <Esc>:tabclose<CR>
:nmap <Leader><Tab> gt<CR>

" Shortcut for entering information
:nmap <Leader>sam <Esc>aSincerely, <CR><CR>Samir Hussain<Esc>

" Loading important files
nnoremap <Leader>f <Esc>:e $HOME/Desktop/finances.txt.gpg<CR>
nnoremap <Leader>i <Esc>:e $HOME/Desktop/internet_accounts.txt.gpg<CR>

" Have the tabbed editing work with internet browser type functionality
" You just use comma instead of CTRL
:nmap <Leader>t <Esc>:tabnew<CR>
:nmap <Leader>w <Esc>:tabclose<CR>
:nmap <Leader><Tab> gt<CR>

" Run ctags
:nmap <Leader>] <Esc>:!ctags -R .<CR>

" Get lines inserted
:nmap <Leader>- <Esc>a-----<Esc>

" Do word wrapping
:nmap <Leader>e <Esc>:set wrap linebreak<CR>

" Do vertical split
:nmap <Leader>vs <Esc>:vsplit<CR>

" Shortcut for having date in the format I prefer
nmap <Leader>date a<C-R>=strftime("%A, %B %d, %Y. %T %Z")<CR><Esc>

" Silly shortcut for summing up entries in custom finance tracker. Highlight
" the financial item and copy it (using CTRL-V)
:nmap <Leader>math <Esc>:tabnew<CR>p<ESC>:%s/[a-zA-Z]* [0-9]* //g<CR>:%s/(.*)//g<CR>:%s/\$//g<CR>:%s/\n/+/g<CR>:%s/+ *-/-/g<CR>:%s/ //g<CR>:s/+*$//g<CR><ESC>gg<ESC>yy<ESC>:!python -c "print <C-r>""<CR>

" Word count
:map <Leader>c g<C-G>

" Save a file you edited in vim/vi without the needed permissions
:map <Leader>save <Esc>:w !sudo tee %<CR>

" Running make - can be partially replaced for vimux prompt command
" :set makeprg=gmake\ \CC=gcc296
:map <Leader>m :make<CR>:copen<CR>

" Map quickfix (mostly for make)
:map <Leader>g :cw<CR>

" Remap in order to make copy/paste easier
nmap  <F6>   <Esc>:set nonumber\|set norelativenumber<CR>


" Key mapping for web searches
function! Terms(prompt)
    call inputsave()
    let searchterm = input(a:prompt . ': ')
    call inputrestore()
    return searchterm
endfunction
map <leader>l :! /usr/bin/firefox 'https://duckduckgo.com/?q=<c-r>=Terms("DuckDuckGo")<cr>'<cr><cr>

filetype plugin indent on     " required!

if has("autocmd")
  " Enabled file type detection and file-type specific plugins.
  " filetype plugin on indent
  filetype plugin on

  " Automatically remove all trailing whitespace before saving
  autocmd BufWritePre * :%s/\s\+$//e

  " Python
  augroup py
    autocmd BufReadPre,FileReadPre      *.py set smarttab softtabstop=4 autoindent
  augroup END

  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb set smarttab
  augroup END

  " Texts file
  augroup mytext
    autocmd BufReadPre,FileReadPre      *.txt set wrap linebreak
  augroup END


endif "if has

"code folding = set foldenable
