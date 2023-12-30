
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
nnoremap <leader>sb :!swift build<cr>
nnoremap <leader>sr :Shell swift run<cr>

autocmd BufRead,Bufnew *.leaf set syntax=html | set ft=html

function! XCPrettyTransformation(cmd) abort
  return a:cmd . ' 2>&1 | xcpretty'
endfunction

function! InitSwift()
  set syntax=swift | set ft=swift
  let g:test#custom_transformations = get(g:, 'test#custom_transformations', {})
  let g:test#custom_transformations['xcpretty'] = function('XCPrettyTransformation')
  let g:test#transformation = 'xcpretty'
endfunction

augroup Swift
  autocmd!
  autocmd Filetype swift call InitSwift()
augroup end


