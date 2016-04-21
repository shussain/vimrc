" vimrc for when all plugins are installed


source ~/_vimrc-simplified

" NerdTree app
:nmap <Leader>n <Esc>:NERDTree $HOME/project
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$']

" Toggle between absolute and relative numbering - using numbers.vim
nnoremap <F2> :NumbersToggle<CR>

" Remap for Tagbar
nmap  <F3>   :TagbarToggle<CR>

" Remap for Gundo
nmap  <F4>   :GundoToggle<CR>

" Remap for vim-latex-live-preview
nmap  <F5>   <Esc>:LLPStartPreview<CR>

" Key mapping for web searches
function! Terms(prompt)
    call inputsave()
    let searchterm = input(a:prompt . ': ')
    call inputrestore()
    return searchterm
endfunction
map <leader>l :! /usr/bin/firefox 'https://duckduckgo.com/?q=<c-r>=Terms("DuckDuckGo")<cr>'<cr><cr>

" ctrl-p
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

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" original repos on github
"Plugin 'itchyny/calendar.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'atweiden/vim-dragvisuals'
Plugin 'bling/vim-airline'
Plugin 'edsono/vim-matchit'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'mhinz/vim-startify'
Plugin 'myusuf3/numbers.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/snipMate'
Plugin 'scrooloose/syntastic'

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
  augroup END

  " Python
  augroup py
    autocmd BufReadPre,FileReadPre      *.py set nowrap
    autocmd BufReadPre,FileReadPre      *.py set smarttab autowrite
    autocmd BufReadPre,FileReadPre      *.py set softtabstop=4 autoindent
    autocmd BufReadPre,FileReadPre      *.py set background=dark
  augroup END

  augroup ruby
    autocmd BufReadPre,FileReadPre      *.rb set nowrap
    autocmd BufReadPre,FileReadPre      *.rb set smarttab autowrite
  augroup END

  augroup cs
    autocmd BufReadPre,FileReadPre      *.cs set nowrap
  augroup END

  augroup aspx
    autocmd BufReadPre,FileReadPre      *.aspx set nowrap
  augroup END

  " Properties file
  augroup properties
    autocmd BufReadPre,FileReadPre      *.properties set nowrap
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
