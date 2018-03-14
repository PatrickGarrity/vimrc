call plug#begin('~/.local/share/nvim/plugged')

Plug 'tyrannicaltoucan/vim-quantum'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
Plug 'w0rp/ale', { 'for': ['scala', 'vim'] }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

filetype plugin indent on
let mapleader=","
let maplocalleader=","
let g:deoplete#enable_at_startup = 1

" === Color Scheme === {{
set termguicolors
set t_Co=256
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme quantum
let g:quantum_italics = 1
let g:rainbow_active = 1
" }}

" === History and Undo Levels === {{
set history=512
set undolevels=128
set undofile
set undodir=~/.config/nvim/undo
" }}

" === Assorted Core Settings === {{
syntax on
set noswapfile
set nocompatible
set modelines=0
set hidden            " Hide buffers
set encoding=utf-8    " Always use UTF-8 explicitly
set number            " Show line numbers by default
set cursorline        " Highlight the current line
set noshowmode        " Hide show-mode, this is for lightline
set showcmd           " Display incomplete commands at the bottom
set noerrorbells      " ... we just don't like beeping
set visualbell        " Flash rather than beep
set t_vb=             " Don't flassh please
set ttyfast           " Some optimizations for rendering
set ruler             " Show row and column number
set laststatus=2      " Last window has a status line
set showmatch         " Show matching parens
set lazyredraw        " redraw only when necessary, hopefully more efficient.
set pastetoggle=<F2>  " Cheap way to paste toggle
set completeopt-=preview " Disable the preview window, usually annoying.
" }}

" === Indentation === {{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
" }}

" === Search Settings === {{
set ignorecase
set smartcase         
set incsearch
set showmatch
set hlsearch
nmap <silent> <leader>/ :nohlsearch<CR>
" }}

" === General Ignores === {{
set wildignore=*.class,*.pyc,*.swp,*.o,*.jar
set wildignore+=*/tmp/*,*.zip,*.tar,*.gz,*.bz2
set wildignore+=*/.idea/*,*.iml
set wildignore+=*/node_modules/*
" }}

" === FZF Configuration and Key Bindings === {{
let $FZF_DEFAULT_COMMAND='rg --files --no-messages "" .'
nmap ; :Buffers<CR>
nmap <C-p> :Files<CR>
" }}

" === ctags Configuration and Key Bindings === {{
set tags=./.git/tags,tags
nnoremap <leader>tm :!ctags -R<CR>
nnoremap <leader>ts :Tags<cr>
nnoremap <leader>tw :call fzf#vim#tags("'".expand('<cword>'))<cr>
nnoremap <leader>tb :BTags<cr>
" }}

" === Other Key Mappings === {{
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
nnoremap <leader>s :up<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bd :bd<cr>
" }}

" === Scala Configuration === {{
au BufNewFile,BufRead *.scala set filetype=scala
au BufNewFile,BufRead *.sbt   set filetype=scala
autocmd FileType scala        setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sbt          setlocal shiftwidth=2 tabstop=2 softtabstop=2
" }}

" === Async Linting (ALE Configuration) === {{
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" }}
