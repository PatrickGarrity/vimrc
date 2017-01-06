set shiftwidth=2
set tabstop=2
set softtabstop=2

let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": [], "passive_filetypes": []}
let g:syntastic_rust_checkers = ['rustc']
let g:ycm_rust_src_path = '/home/eidolon/src/rust/src'
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
nnoremap <Leader>] :YcmCompleter GoTo<CR>
nnoremap <leader>cc :SyntasticCheck<cr>
nnoremap <leader>cl :lclose<cr>
