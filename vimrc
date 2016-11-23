" Plugin loading, installation, etc.

call plug#begin('~/.vim/plugged')

" Install a huge variety of color schemes
Plug 'flazz/vim-colorschemes'

" ctrlp provides full path fuzzy * finding
Plug 'ctrlpvim/ctrlp.vim'

" Commands for automatically commenting lines in different languages
Plug 'scrooloose/nerdcommenter'

" Excellent Git plugin for more full-featured Git interactions
Plug 'tpope/vim-fugitive'

" More sophisticated repeat (.) behavior
Plug 'tpope/vim-repeat'

" Deal with any surrounding text (quotes, parens, etc.)
Plug 'tpope/vim-surround'

" Some basic mappings, useful for things like git diff navigation
Plug 'tpope/vim-unimpaired'

" Text objects for JSON (and pretty printing)
Plug 'tpope/vim-jdaddy'

" Dispatch, used as a dependency for other development plugins
Plug 'tpope/vim-dispatch'

" Used as a dependency for other development plugins (project management)
Plug 'tpope/vim-projectionist'

" Rainbow parentheses - they're nice, can leave them on always
Plug 'luochen1990/rainbow'

" Git gutter - show glyphs in the left hand column for Git status
Plug 'airblade/vim-gitgutter'

" lightline - much improved (and fast) status line plugin
Plug 'itchyny/lightline.vim'

" YCM, includes installation function
function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !./install.py
    endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" ---------------------------------------------------------
" Clojure Plugins, only enable during Clojure Development
" ---------------------------------------------------------
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }

" TODO: Add support for syntastic and vim-eastwood

" ---------------------------------------------------------
" Vim Org-Mode and supporting plugins
" ---------------------------------------------------------
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/taglist.vim'
Plug 'tpope/vim-speeddating'

" ---------------------------------------------------------
" Scala Plugins (ENSIME) -- Experimental
" ---------------------------------------------------------
" Plug 'ensime/ensime-vim', { 'for': ['scala', 'java'] }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

" ---------------------------------------------------------
" Syntastic and anything directly required
" ---------------------------------------------------------
" Plug 'scrooloose/syntastic'

" ---------------------------------------------------------
" Markdown and Document Editing
" ---------------------------------------------------------
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'md'] }

call plug#end()

" Basic Settings
filetype plugin indent on
syntax on
set noswapfile
set nocompatible
set modelines=0

" Configure the leader key to be comma
let mapleader=","
let maplocalleader=","

" Clean switching between buffers
set hidden

" Always use UTF-8 explicitly
set encoding=utf-8

" History
set history=512
set undolevels=128

" Color scheme
" Usually want 256 color with dark background
set t_Co=256
set background=dark
colorscheme lucid

" Tab settings - use 4 spaces by default
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

" Basic display settings
set number            " Show line numbers by default
set cursorline        " Highlight the current line
set showmode          
set showcmd
set visualbell        " Flash rather than beep
set noerrorbells      " ... we just don't like beeping
set ttyfast           " Some optimizations for rendering
set ruler             " Show row and column number
set laststatus=2      " Last window has a status line
set colorcolumn=120   " Show a bar at column 120 (indicate long lines)
set showmatch         " Show matching parens

" Search settings
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Use leader and / to clear search results
nmap <silent> <leader>/ :nohlsearch<CR>

" Remap tab to % in normal mode, allows movement among bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Some file types we don't care about in general, add to this over time
set wildignore=*.class,*.pyc,*.swp

" Save the current file if it has been updated when window focus lost
au FocusLost * :up

" Save the current file if it has been updated:
nnoremap <leader>s :up<cr>

" Use F2 to insert paste mode
set pastetoggle=<F2>

" Maximum number of signs displayed by the git gutter plugin
let g:gitgutter_max_signs=500

" lightline configuration (color scheme, etc.)
" let g:lightline = { 'colorscheme': 'wombat' }
set noshowmode

" Enable omni-completion
set omnifunc=syntaxcomplete#Complete

" Custom file types
autocmd FileType clojure setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scala   setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sbt     setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sql     setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType make    setlocal noexpandtab

" Git Mergetool commands - accept remote, accept local
nnoremap <silent> <leader>mre :diffg RE
nnoremap <silent> <leader>mlo :diffg LO

" Assign certain extensions to different file types
au BufNewFile,BufRead *.md  set filetype=markdown
au BufNewFile,BufRead *.sbt set filetype=scala

" Used for Clojure only -- reformat files on save
let g:clj_fmt_autosave=1

" Custom commands for moving around buffers
nnoremap <leader>bh :bp<cr>
nnoremap <leader>bl :bn<cr>
nnoremap <leader>bd :bd<cr>

" Only for Clojure files
" Use ctrl+c, ctrl+k in normal mode to do a require
" This hot reloads code into the JVM
au FileType clojure nmap <c-c><c-k> :Require<cr>

" Git commands (key bindings for fugitive)
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>ga :Git add %:p<cr><cr>

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Goyo configuration (for Markdown, and potentially other documents)
let g:goyo_width = 120
