set nocompatible

" Initial restarting
"autocmd!

set showmode
set showcmd

" Formatting
set number
set ruler
set encoding=utf-8

" Keep cursor away from edges of screen.
set so=5

" Show the line number relative to the line with the cursor in front of each line
set relativenumber

" Autocomplete for file entry
set wim=list:longest,full

" Autocomplete for Ctrl-N and Ctrol-P. We are looking at open/hidden buffers
" and tags
set complete=.,b,u,t

" Ignore cases for searching
set ignorecase
set smartcase

" show the first match for the pattern, while typing it
set incsearch

" highlight all search matches
set hlsearch

" Set visual bell  instead of beep
" Good when not wearing earphone at work
set visualbell

set shell=/bin/zsh

" No backup thanks to source control but might change this later
set nobackup

" Place a line at 80 columns to visibly mark the point where most code should
" end or be wrapped
set colorcolumn=80
"highlight colorcolumn ctermbg=233


" Set the global map leader variable so that:
:let mapleader = ","

" Remap semicolon to map (for Ex commands) since colon is important
" NOTE TO SELF: ; is used to repeat last motion so it may be useful
nnoremap ; :

" Remap Caps lock to be escape
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Make it easy to update/reload _vimrc
:nmap <Leader>s :source $HOME/_vimrc<CR>
:nmap <Leader>v :e $HOME/_vimrc<CR>

" Deal with going up and down with long line
:nnoremap k gk
:nnoremap j gj

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
imap <Leader>date <C-R>=strftime("%A, %B %d, %Y. %T %Z")<CR>

" NerdTree app
:nmap <Leader>n <Esc>:NERDTree $HOME/project
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$']

" Silly shortcut for summing up entries in custom finance tracker. Highlight
" the financial item and copy it (using CTRL-V)
:nmap <Leader>math <Esc>:tabnew<CR>p<ESC>:%s/[a-zA-Z]* [0-9]* //g<CR>:%s/(.*)//g<CR>:%s/\$//g<CR>:%s/\n/+/g<CR>:%s/+ *-/-/g<CR>:%s/ //g<CR>:s/+*$//g<CR><ESC>gg<ESC>yy<ESC>:!python -c "print <C-r>""<CR>

" Word count
:map <Leader>c g<C-G>

" Save a file you edited in vim/vi without the needed permissions
:map <Leader>save <Esc>:w !sudo tee %<CR>

" Toggle between absolute and relative numbering - using numbers.vim
nnoremap <F2> :NumbersToggle<CR>

" Remap for Tagbar
nmap  <F3>   :TagbarToggle<CR>

" Remap for Gundo
nmap  <F5>   :GundoToggle<CR>

" Map quicfix
:map <Leader>g :cw<CR>

" Key mapping for web searches
function! Terms(prompt)
    call inputsave()
    let searchterm = input(a:prompt . ': ')
    call inputrestore()
    return searchterm
endfunction
map <leader>l :! /usr/bin/firefox 'https://duckduckgo.com/?q=<c-r>=Terms("DuckDuckGo")<cr>'<cr><cr>

" Loading important files
nnoremap <Leader>f <Esc>:e ~/Desktop/finances.txt<CR>
nnoremap <Leader>i <Esc>:e ~/Desktop/internet_accounts.txt<CR>

" ctrlp
let g:ctrlp_map = ',p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'O'
set wildignore+=*/tmp/*,*.so,*.swp,*.pyc

nnoremap <Leader>b <Esc>:CtrlPBuffer<CR>

" For vim-airline, require statusline to appear
set laststatus=2

" drag visual configuration
runtime plugin/dragvisuals.vim
vmap <expr> h DVB_Drag('left')
vmap <expr> l DVB_Drag('right')
vmap <expr> j DVB_Drag('down')
vmap <expr> k DVB_Drag('up')
vmap <expr> D DVB_Duplicate()

" Shortcut for entering information
:nmap <Leader>sam <Esc>aSincerely, <CR><CR>Samir Hussain<Esc>

" Spelling changes. Fix common typos and mistakes I make
abbreviate eg e.g.
abbreviate etc etc.
abbreviate teh the
abbreviate thier their
abbreviate woudl would
abbreviate definately definitely
abbreviate Credil CREDIL
abbreviate Phillipinne Philippine
abbreviate Phillipine Philippine
abbreviate Philipinne Philippine

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github
"Bundle 'itchyny/calendar.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'atweiden/vim-dragvisuals'
Bundle 'bling/vim-airline'
Bundle 'edsono/vim-matchit'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'myusuf3/numbers.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-speeddating'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/snipMate'
Bundle 'scrooloose/syntastic'

" Colorscheme
Bundle 'nanotech/jellybeans.vim'

" Syntastic configuration
set statusline+=%#errormsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_quiet_messages = { "level": "warnings" }

" Calendar.vim -> using Google calendar and tasks
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1

" When encrypting any file, use the much stronger blowfish algorithm
set cryptmethod=blowfish

filetype plugin indent on     " required!

if has ("autocmd")
  " Enabled file type detection and file-type specific plugins.
  " filetype plugin on indent
  filetype plugin on

  " Automatically remove all trailing whitespace before saving
  autocmd BufWritePre * :%s/\s\+$//e

  " Java code.
  augroup java
    autocmd BufReadPre,FileReadPre      *.java set nowrap
    autocmd BufReadPre,FileReadPre      *.java set syntax=on
  augroup END

  " Python
  augroup py
    autocmd BufReadPre,FileReadPre      *.py set nowrap
    autocmd BufReadPre,FileReadPre      *.py set syntax=on
    autocmd BufReadPre,FileReadPre      *.py set smarttab autowrite
    autocmd BufReadPre,FileReadPre      *.py set softtabstop=4 autoindent
    autocmd BufReadPre,FileReadPre      *.py set background=dark
  augroup END

  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb set nowrap
    autocmd BufReadPre,FileReadPre      *.rb set syntax=on
    autocmd BufReadPre,FileReadPre      *.rb set smarttab autowrite
  augroup END

  augroup cs
    autocmd BufReadPre,FileReadPre      *.cs set nowrap
    autocmd BufReadPre,FileReadPre      *.cs set syntax=on
  augroup END

  augroup aspx
    autocmd BufReadPre,FileReadPre      *.aspx set nowrap
    autocmd BufReadPre,FileReadPre      *.aspx set syntax=aspvbs
  augroup END

  " Properties file
  augroup properties
    autocmd BufReadPre,FileReadPre      *.properties set nowrap
    autocmd BufReadPre,FileReadPre      *.properties set syntax=off
    autocmd BufReadPre,FileReadPre      *.properties set syntax=off
  augroup END

  " Texts file
  augroup mytext
    autocmd BufReadPre,FileReadPre      *.txt set wrap linebreak
    autocmd BufReadPre,FileReadPre      *.txt set syntax=off
    autocmd BufReadPre,FileReadPre      *.txt set spell spelllang=en_ca
  augroup END


  " DEFAULT SETTING FOR FILES THAT ARE NOT GROUPED

  " Wrapping & column stuff
  set wrapmargin=8

  " Graphical settings
  colorscheme zenburn

  set nowrap "columns=80 lines=30

  set tabstop=4
  set shiftwidth=4
  set expandtab
  set spell spelllang=en_ca
endif "if has

"code folding = set foldenable
