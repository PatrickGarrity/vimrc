set shiftwidth=2
set tabstop=2
set softtabstop=2

let g:syntastic_rust_checkers = ['rustc']
let g:ycm_rust_src_path = '/home/eidolon/src/rust/src'
nnoremap <Leader>] :YcmCompleter GoTo<CR>
