" Simplified vimrc for use when using an older instance of vim or
" where there are no vim plugins

" Set the global map leader variable as comma (",")
:let mapleader = ","

source $HOME/_vimrc-plugin
source $HOME/_vimrc-linux
source $HOME/_vimrc-personal
source $HOME/_vimrc-notused

set nocompatible

set showmode " show the mode we are in (Insert, visual, etc)
set showcmd  " Show partial command

" Formatting
set encoding=utf-8
set ruler
set title

" Show the line number relative to the line with the cursor in front of each line
set relativenumber number

" Keep cursor away from edges of screen.
set so=3

" Autocomplete for file entry
set wim=list:longest,full

" Autocomplete for Ctrl-N and Ctrl-P. We are looking at open/hidden buffers
" and tags
set complete=.,b,u,t

" Ignore cases for searching
set ignorecase smartcase

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

" Set the commands to save in history. Default number is 20.
set history=1000

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
set smarttab
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab

" Place a line at 80 columns to visibly mark the point where most code should
" end or be wrapped
set colorcolumn=80
"highlight colorcolumn ctermbg=233

if has("mouse")
    set mouse=a
endif

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
abbreviate Apian Appian
abbreviate MIke Mike
abbreviate Samera Sameera

" Remap semicolon to map (for Ex commands) since colon is important
" NOTE TO SELF: ; is used to repeat last motion so it may be useful
nnoremap ; :

" Have the tabbed editing work with internet browser type functionality
" You just use leader instead of CTRL
:nmap <Leader>t <Esc>:tabnew<CR>
:nmap <Leader>w <Esc>:tabclose<CR>
:nmap <Leader><Tab> gt<CR>

" Shortcut for entering information
:nmap <Leader>sam <Esc>aSincerely, <CR><CR>Samir Hussain<Esc>

" Run ctags
:nmap <Leader>] <Esc>:!ctags -R .<CR>

" Get lines inserted
:nmap <Leader>- <Esc>a-----<Esc>

" Do word wrapping
:nmap <Leader>e <Esc>:set wrap linebreak<CR>

" Do vertical split
:nmap <Leader>vs <Esc>:vsplit<CR>

" Shortcut for having date in the format I prefer
nmap <Leader>date a<C-R>=strftime("%A, %B %d, %Y. %H:%M %Z")<CR><Esc>

" Shortcut for making work notes
nmap <Leader>notes ggI<C-R>=strftime("%A, %B %d, %Y. %H:%M %Z")<CR><CR><CR>-----<CR><CR><Esc>ggj

" Shortcut for large font
nmap <leader>large <Esc>:set guifont=Monospace\ 24<CR><Esc>

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
nmap  <F2>   <Esc>:set nonumber\|set norelativenumber<CR>

:map <Leader>1 :.!toilet -w 200 -f term -F border<CR>

filetype plugin indent on     " required!

if has("autocmd")
  " Enabled file type detection and file-type specific plugins.
  " filetype plugin on indent
  filetype plugin on

  " Automatically remove all trailing whitespace before saving
  autocmd BufWritePre * :%s/\s\+$//e

  " Python
  augroup py
    autocmd BufReadPre,FileReadPre      *.py set autoindent
  augroup END

  " Texts file
  augroup mytext
    autocmd BufReadPre,FileReadPre      *.txt set wrap linebreak
  augroup END

  " Redmine file
  augroup redmine
    autocmd BufNewFile,BufReadPre        *.redmine set filetype=redminewiki
  augroup END

endif "if has
