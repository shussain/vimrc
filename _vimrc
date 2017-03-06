" vimrc for when all plugins are installed

source $HOME/_vimrc-noplugin

" NerdTree app
:nmap <Leader>n <Esc>:NERDTree $HOME/project
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$']

" Toggle between absolute and relative numbering - using numbers.vim
nnoremap <F2> :NumbersToggle<CR>

" Remap for Tagbar
nmap  <F3>   :TagbarToggle<CR>

" Remap for undotree
nmap  <F4>   :UndotreeToggle<CR>

" Remap for vim-latex-live-preview
nmap  <F7>   <Esc>:LLPStartPreview<CR>

" ctrl-p
let g:ctrlp_map = ',p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'O'
set wildignore+=*/tmp/*,*.so,*.swp,*.pyc

nnoremap <Leader>b <Esc>:CtrlPBuffer<CR>

" For vim-airline, require statusline to appear
set laststatus=2

" Drag visual configuration
runtime plugin/dragvisuals.vim
vmap <expr> h DVB_Drag('left')
vmap <expr> l DVB_Drag('right')
vmap <expr> j DVB_Drag('down')
vmap <expr> k DVB_Drag('up')
vmap <expr> D DVB_Duplicate()

filetype off                   " Required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" Vim plugin
"Plugin 'itchyny/calendar.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'atweiden/vim-dragvisuals'
Plugin 'bling/vim-airline'
Plugin 'shussain/vim-matchit'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'mhinz/vim-startify'
Plugin 'myusuf3/numbers.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'mbbill/undotree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/snipMate'
Plugin 'scrooloose/syntastic'
Plugin 'jamessan/vim-gnupg'

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

  " Specify color scheme
  colorscheme apprentice

" Calendar.vim -> using Google calendar and tasks
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1

filetype plugin indent on     " Required!

if has ("autocmd")


endif "if has
