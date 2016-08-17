" vimrc for when all plugins are installed

source ~/_vimrc-noplugin

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
Bundle 'romainl/Apprentice'

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

  " Graphical settings
  colorscheme apprentice

endif "if has
