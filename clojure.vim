set shiftwidth=2
set tabstop=2
set softtabstop=2

" Reformat files on save
let g:clj_fmt_autosave=1

" Use ctrl+c, ctrl+k in normal mode to do a require
" This hot reloads code into the JVM
nmap <c-c><c-k> :Require<cr>
