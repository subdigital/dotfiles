" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-vsnip'
Plug 'j-hui/fidget.nvim'

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'

" AST Stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Terminal
Plug 'akinsho/toggleterm.nvim'

" HTML
Plug 'mattn/emmet-vim'

" Ruby/Rails stuff
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

" Search
Plug 'nvim-lua/plenary.nvim'
if has("gui_vimr")
  Plug 'cloudhead/neovim-fuzzy'
else
  " not yet supported in vimr
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-ui-select.nvim'
end
Plug 'dyng/ctrlsf.vim'

" Tags
Plug 'majutsushi/tagbar'

" Testing
Plug 'vim-test/vim-test'

" Swift
Plug 'keith/swift.vim'

" Rust
Plug 'simrat39/rust-tools.nvim'
Plug 'timonv/vim-cargo'

" Comments
Plug 'tpope/vim-commentary'

" Bottom bar stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'matthewbdaly/vim-filetype-settings'

" Themes
Plug 'nanotech/jellybeans.vim', { 'as': 'jellybeans' }
Plug 'rktjmp/lush.nvim'
Plug 'gruvbox-community/gruvbox'

call plug#end()

" Airline customization
let g:airline_powerline_fonts = 1

let mapleader = ","
set mouse=a

" reload this file when it changes
autocmd! BufWritePost {init.vim} source %
nnoremap <leader>V mR :e ~/.config/nvim/init.vim<cr>

" allow hiding modified buffers
set hidden
nnoremap <silent> <leader>b :b#<cr>

syntax on
set background=dark
colorscheme jellybeans
" colorscheme gruvbox
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set termguicolors

set nu
filetype plugin indent on
set nocp
set ruler
set wildmenu
set t_Co=256
set signcolumn=yes "fixed width gutter

set autoindent
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" show invisibles
set list
set listchars=tab:▸\ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Map return to disable search highlighting
nnoremap <silent> <return> :nohlsearch<cr><cr>

" 4 space indent for somes file types
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype swift setlocal ts=4 sts=4 sw=4

" indent when changing full lines
nnoremap C C<esc>S

" better undo breakpoints for punctuation
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" add jumplist markers for longer jumps
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" scroll sooner
set scrolloff=5
set sidescrolloff=25

" Syntax highlighting in Markdown
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['bash=sh', 'css', 'ruby', 'javascript', 'js=javascript', 'swift']

" Use :Shell to run a command and put the output in a new scratch
" buffer
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" move text
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
nnoremap <leader>[ :m .-2<cr>==
nnoremap <leader>] :m .+1<cr>==

" keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" continue selection when indenting
vnoremap > >gv
vnoremap < <gv

" Nerdtree
nnoremap <leader>nb :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <c-\> :NERDTreeToggle<cr>

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
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

" Quickfix navigation
nnoremap <Leader>j :cnext<cr>
nnoremap <Leader>k :cprev<cr>
nnoremap <Leader>q :copen<cr>

" Tab navigation
nnoremap <Leader>tn :tabn<cr>
nnoremap <Leader>tp :tabp<cr>

" Search
if has_key(plugs, 'telescope.nvim')
  nnoremap <c-p> <cmd>Telescope find_files<cr>
  source ~/.config/nvim/telescope.vim
endif

if has_key(plugs, 'neovim-fuzzy')
  nnoremap <c-p> :FuzzyOpen<cr>
endif

nmap <c-F> <Plug>CtrlSFPrompt
nmap <leader>fn <Plug>CtrlSFCwordPath<cr>
nmap <leader>ft :CtrlSFToggle<cr>

" Rails
nnoremap <leader>Rv :Eview<cr>

" Testing
nnoremap <silent><leader>tf :TestFile<cr>
nnoremap <silent><leader>tc :TestNearest<cr>
let test#strategy = "neovim"

" Completion
source ~/.config/nvim/lsp-config.vim
source ~/.config/nvim/vsnip.vim
luafile ~/.config/nvim/cmp-config.lua

" Language specific config
source ~/.config/nvim/swift.vim
source ~/.config/nvim/rust.vim

" Dash integration for documentation searches
command! DashOpen !open dash://"<cword>"<cr>
command! DashSwift !open dash://apple\%3a"<cword>"<cr>
" nmap <silent> K :DashOpen<cr>\|:redraw!<cr>
" autocmd Filetype swift nmap <silent> K :DashSwift<cr>\|:redraw!<cr>

" Toggleterm
source ~/.config/nvim/toggleterm.lua


if has("gui_vimr")
  " VimR specific settings

  " macOS style tab navigation
  nnoremap <silent><D-S-{> gT
  nnoremap <silent><D-S-}> gt
  nnoremap <silent><D-t> :tabnew<cr>:FuzzyOpen<cr>
  vnoremap <silent><D-/> :Commentary<cr>
  nnoremap <silent><D-/> :Commentary<cr>
  inoremap <silent><D-/> <esc>:Commentary<cr>i

  " ⌘⇧F to search project as well
  nmap <D-S-f> <Plug>CtrlSFPrompt

  " ⌘B to build in swift
  nnoremap <D-b> :!swift build<cr> 
  nnoremap <D-r> :!swift run<cr> 
endif
