set nocompatible
source /usr/share/vim/vim73/vimrc_example.vim
"source /usr/share/vim/vim73/mswin.vim
behave mswin

" Initial restarting
"autocmd!

set showmode
set showcmd

" Formatting
set number
set ruler
set encoding=utf-8

" Show the line number relative to the line with the cursor in front of each line
set relativenumber

" Autocomplete for file entry
set wim=list:longest,full

" Ignore cases for searching
set ignorecase
set smartcase

" Set visual bell  instead of beep
" Good when not wearing earphone at work
set visualbell

set shell=/bin/zsh

" Set the global map leader variable so that:
:let mapleader = ","

" Make it easy to update/reload _vimrc
:nmap <Leader>s :source _vimrc<CR>
:nmap <Leader>v :e _vimrc<CR>

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

" Shortcut for having date in the format I prefer
:nmap <Leader>date <Esc>!!date +%a, %b. %d, %Y<Esc>

" NerdTree app
:nmap <Leader>n <Esc>:NERDTree /home/habibilus/dnsx-monitor/src
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$']

" Silly shortcut for summing up entries in custom finance tracker
:nmap <Leader>math <Esc>:%s/[a-zA-Z]* [0-9]* //g<CR>:%s/(.*)//g<CR>:%s/\$//g<CR>:%s/\n/+/g<CR>:%s/+ *-/-/g<CR>:%s/ //g<CR>:s/+*$//g<CR>

" Word count
:map \c g<C-G>

" Save a file you edited in vim/vi without the needed permissions
:map <Leader>save <Esc>:w !sudo tee %<CR>

" Remap for ShowFunc
map  <F2>   <Plug>ShowFunc
map! <F2>   <Plug>ShowFunc

" Key mapping for web searches
function! Terms(prompt)
    call inputsave()
    let searchterm = input(a:prompt . ': ')
    call inputrestore()
    return searchterm
endfunction
map <leader>f :! /usr/bin/chromium-browser 'https://duckduckgo.com/?q=<c-r>=Terms("DuckDuckGo")<cr>'<cr><cr>

" Spelling changes. fix common typos and mistakes I make
abbreviate teh the
abbreviate eg e.g.
abbreviate etc etc.
abbreviate Phillipinne Philippine
abbreviate Phillipine Philippine
abbreviate Philipinne Philippine
abbreviate thier their
abbreviate definately definitely
abbreviate Credil CREDIL

" No backup thanks to source control but might change this later
set nobackup

" Shortcut for entering information
:nmap <Leader>sam <Esc>aSamir Hussain<CR>CREDIL<Esc>


if has ("autocmd")
  " Enabled file type detection and file-type specific plugins.
  " filetype plugin on indent
  filetype plugin on

  " Automatically remove all trailing whitespace before saving
  autocmd BufWritePre * :%s/\s\+$//e

  " Java code.
  augroup java
    autocmd BufReadPre,FileReadPre      *.java set nowrap columns=100 lines=40
    autocmd BufReadPre,FileReadPre      *.java set syntax=on
    autocmd BufReadPre,FileReadPre      *.java colorscheme murphy
  augroup END

  " Python
  augroup py
    autocmd BufReadPre,FileReadPre      *.py set nowrap columns=100 lines=40
    autocmd BufReadPre,FileReadPre      *.py set syntax=on
    autocmd BufReadPre,FileReadPre      *.py set smarttab autowrite
    autocmd BufReadPre,FileReadPre      *.py set tabstop=4 shiftwidth=4 expandtab
    autocmd BufReadPre,FileReadPre      *.py set softtabstop=4 autoindent
    autocmd BufReadPre,FileReadPre      *.py set relativenumber
    autocmd BufReadPre,FileReadPre      *.py set background=dark
    autocmd BufReadPre,FileReadPre      *.py colorscheme solarized
  augroup END

  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb set nowrap
    autocmd BufReadPre,FileReadPre      *.rb set syntax=on
    autocmd BufReadPre,FileReadPre      *.rb set tabstop=2 shiftwidth=2 bs=2 expandtab
    autocmd BufReadPre,FileReadPre      *.rb set smarttab autowrite
    autocmd BufReadPre,FileReadPre      *.rb colorscheme evening
  augroup END

  augroup cs
    autocmd BufReadPre,FileReadPre      *.cs set nowrap columns=100
    autocmd BufReadPre,FileReadPre      *.cs set syntax=on
    autocmd BufReadPre,FileReadPre      *.cs colorscheme murphy
  augroup END

  augroup aspx
    autocmd BufReadPre,FileReadPre      *.aspx set nowrap columns=100 lines=40
    autocmd BufReadPre,FileReadPre      *.aspx set syntax=aspvbs
    autocmd BufReadPre,FileReadPre      *.aspx colorscheme zenburn
  augroup END

  " Properties file
  augroup properties
    autocmd BufReadPre,FileReadPre      *.properties set nowrap columns=90 lines=20
    autocmd BufReadPre,FileReadPre      *.properties set syntax=off
    autocmd BufReadPre,FileReadPre      *.properties set syntax=off
    autocmd BufReadPre,FileReadPre      *.proeprties set tabstop=2 shiftwidth=2 expandtab
    autocmd BufReadPre,FileReadPre      *.properties colorscheme pablo
  augroup END

  " Texts file
  augroup mytext
    autocmd BufReadPre,FileReadPre      *.txt set wrap linebreak
    autocmd BufReadPre,FileReadPre      *.txt set lines=30
    autocmd BufReadPre,FileReadPre      *.txt set syntax=off
    autocmd BufReadPre,FileReadPre      *.txt set tabstop=2 shiftwidth=2 expandtab
    autocmd BufReadPre,FileReadPre      *.txt colorscheme slate
    autocmd BufReadPre,FileReadPre      *.txt set spell spelllang=en_ca
  augroup END


  " DEFAULT SETTING FOR FILES THAT ARE NOT GROUPED

  " Wrapping & column stuff
  set columns=80
  set wrapmargin=8
  set nowrap
  set lines=22

  " Graphical settings
  colorscheme darkblue
  set nowrap columns=100 lines=30

  set tabstop=4
  set shiftwidth=4
  set expandtab
  set spell spelllang=en_ca
  "Set word count
endif "if has


"code folding = set foldenable
