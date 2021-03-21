let g:polyglot_disabled = ['markdown']

" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" HTML
Plug 'mattn/emmet-vim'

" Ruby/Rails stuff
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

" Javascript stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Search
Plug 'cloudhead/neovim-fuzzy'
Plug 'dyng/ctrlsf.vim'

" Tags
Plug 'majutsushi/tagbar'

" Swift
Plug 'lilyball/vim-swift'

" Comments
Plug 'tpope/vim-commentary'

" Bottom bar stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'matthewbdaly/vim-filetype-settings'

" Themes
Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }

call plug#end()

let mapleader = ","
set mouse=a

" reload this file when it changes
autocmd! BufWritePost {init.vim} source %
nnoremap <leader>V :e ~/.config/nvim/init.vim<cr>

" allow hiding modified buffers
set hidden
nnoremap <silent> <leader>b :b#<cr>

syntax on
colorscheme jellybeans
set nu
filetype plugin indent on
set nocp
set ruler
set wildmenu
set t_Co=256

set autoindent
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Map return to disable search highlighting
:nnoremap <return> :nohlsearch<cr><cr>

" CTags
set tags=tags; "use project local tags files

" 4 space indent for somes file types
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype swift setlocal ts=4 sts=4 sw=4

" scroll sooner
set scrolloff=5

" Syntax highlighting in Markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['bash=sh', 'css', 'ruby', 'javascript', 'js=javascript', 'swift']

" Nerdtree
:nnoremap <leader>nb :NERDTreeToggle<cr>
:nnoremap <leader>nf :NERDTreeFind<cr>
:nnoremap <c-\> :NERDTreeToggle<cr>

" Use leader prefix to use system pasteboard
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P


" Window movement
:nnoremap <C-H> <C-W>h
:nnoremap <C-J> <C-W>j
:nnoremap <C-K> <C-W>k
:nnoremap <C-L> <C-W>l

" Tab navigation
:nnoremap <Leader>tn :tabn<cr>
:nnoremap <Leader>tp :tabp<cr>

" Search
:nnoremap <c-p> :FuzzyOpen<cr>
nmap <c-F> <Plug>CtrlSFPrompt
nmap <leader>fn <Plug>CtrlSFCwordPath<cr>

" Rails
:nnoremap <leader>Rv :Eview<cr>
:nnoremap <leader>Rc :Econtroller<cr>
:nnoremap <leader>Rm :Emodel<cr>
