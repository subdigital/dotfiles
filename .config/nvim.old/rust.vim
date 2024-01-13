lua require('rust-tools').setup({})

function! s:AppendBreakpoint()
  let s:filenosrc = substitute(expand('%'), "src/", "", "")
  let s:breakpoint = "break set --file ".s:filenosrc." --line ".line('.')
  call writefile([s:breakpoint], "./target/breakpoints", "a")
  echom "Added breakpoint at line ".line('.')
endfunction

function! s:ClearBreakpoints()
  call delete("./target/breakpoints")
  echom "Cleared breakpoints"
endfunction

function! s:DebugRun()
  execute "!cargo build"
  let s:dirlist = split(getcwd(), '/')
  let s:projectname = s:dirlist[len(s:dirlist)-1]
  let s:executable = getcwd()."/target/debug/".s:projectname
  execute "!zsh -c 'rust-lldb --arch arm64 --source ./target/breakpoints ".s:executable." &'"
endfunction

function! InitRust()
  nnoremap <leader>rr :Shell RUST_BACKTRACE=1 cargo run<cr>
  nnoremap <leader>rb :CargoBuild<cr>
  nnoremap <leader>rc :RustOpenCargo<cr>
  nnoremap <leader>rt :CargoTest<cr>

  " debugging
  nnoremap <leader>da :call<SID>AppendBreakpoint()<cr>
  nnoremap <leader>dc :call<SID>ClearBreakpoints()<cr>
  nnoremap <leader>dr :call<SID>DebugRun()<cr>
endfunction

augroup Rust
  autocmd!
  autocmd Filetype rust call InitRust()
augroup end



