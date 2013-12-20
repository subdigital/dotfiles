" I am forever unsatisfied with fonts and color schemes.  I keep some good
" ones in here so I can easily cycle through them.
"
" set guifont=DroidSansMono:h16
" set guifont=Monaco:h18
" set guifont=Inconsolata:h18
" set guifont=Bitstream\ Vera\ Sans\ Mono:h18
" set guifont=Envy\ Code\ R:h12
" set guifont=Source\ Code\ Pro:h14
set guifont=Bitstream\ Vera\ Sans\ Mono\ for\ Powerline:h14

set guioptions-=T  " No toolbar
set guioptions-=L  " No scrollbars
set guioptions-=r

" colorscheme railscasts
" colorscheme grb256
" colorscheme github
" colorscheme Tomorrow-Night
" colorscheme Mustang_Vim_Colorscheme_by_hcalves 
colorscheme hemisu
set background=dark

" Quick font size management
nnoremap <D-+> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)+1)',
 \ '')<CR>
nnoremap <D-_> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)-1)',
 \ '')<CR>

function! PresentationMode ()
  set guifont=Inconsolata:h20
  colorscheme github
  set lines=33
  set window=32
endfunction

" use CMD T for CtrlP instead of blank tab
macm File.New\ Tab key=<nop>
nmap <D-t> :tabnew<cr><c-p>


"XMPFILTER
nmap <buffer> <D-R> <Plug>(xmpfilter-run)
xmap <buffer> <D-R> <Plug>(xmpfilter-run)
imap <buffer> <D-R> <Plug>(xmpfilter-run)

nmap <buffer> <D-M> <Plug>(xmpfilter-mark)
xmap <buffer> <D-M> <Plug>(xmpfilter-mark)
imap <buffer> <D-M> <Plug>(xmpfilter-mark)
