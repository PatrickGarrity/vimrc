" =========================================================
" Vim Plug -- All Plugins
" ~~~~~~~~~~~~~~~~~~~~~~~
" - Use :PlugStatus to list plugins
" - Use :PlugInstall <plugin> to install
" =========================================================

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

" buffer list support for lightline
" if this doesn't work out, please see ap/vim-buftabline and
" remove the configuration from the bottom of this file.
Plug 'taohex/lightline-buffer'

" tabular - plugin for aligning text
Plug 'godlygeek/tabular'

" mundo - undo tree visualizer
Plug 'simnalamburt/vim-mundo'

" search with ack (or ideally ag, see config below)
Plug 'mileszs/ack.vim'

" YCM, includes installation function
function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !./install.py --racer-completer
    endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Clojure Plugins, only enable during Clojure Development
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-salve', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }

" Haskell Plugins, only enable during Haskell Development
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Shougo/vimproc.vim', { 'do' : 'make', 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

" Rust Plugins
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml'

" Vim Org-Mode and supporting plugins
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/taglist.vim'
Plug 'tpope/vim-speeddating'

" Scala Plugins 
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }

" Syntastic and anything directly required
Plug 'scrooloose/syntastic', { 'for': ['haskell', 'rust'] }

" Markdown and Document Editing
Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'md'] }

call plug#end()

" =========================================================
" Core configuration
" =========================================================

filetype plugin indent on
syntax on
set noswapfile
set nocompatible
set modelines=0
let mapleader=","
let maplocalleader=","

" Clean switching between buffers
set hidden

" Always display the tabline -- this will cause a bar to appear
" at the top of the window.
set showtabline=2

" Always use UTF-8 explicitly
set encoding=utf-8

" History
set history=512
set undolevels=128
set undofile
set undodir=~/.vim/undo

" Color scheme
" Usually want 256 color with dark background
set t_Co=256
set background=dark
colorscheme lucid

" Set colors for the YouCompleteMe completion window.
" This should be done after the colorscheme is selected.
highlight Pmenu ctermfg=11 ctermbg=8 cterm=bold

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
set noshowmode          
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

" Some file types we don't care about in general, add to this over time
set wildignore=*.class,*.pyc,*.swp

" Save the current file if it has been updated when window focus lost
au FocusLost * :up

" Use F2 to insert paste mode
set pastetoggle=<F2>

" Maximum number of signs displayed by the git gutter plugin
let g:gitgutter_max_signs=500

" lightline configuration (color scheme, etc.)
" let g:lightline = { 'colorscheme': 'wombat' }
set noshowmode

" Enable omni-completion
set omnifunc=syntaxcomplete#Complete

" Indentation for file types that don't get their own vimrc
autocmd FileType sbt     setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sql     setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType make    setlocal noexpandtab

" Assign certain extensions to different file types
au BufNewFile,BufRead *.md  set filetype=markdown
au BufNewFile,BufRead *.sbt set filetype=scala

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Goyo configuration (for Markdown, and potentially other documents)
let g:goyo_width = 120

" mundo -- undo tree visualization
" This vimrc is designed to work with Vim that's packaged in
" Ubuntu 16.04, which utilizes Python 3.
let g:mundo_prefer_python3 = 1

" use the 'ag' command in place of 'ack' if it's executable
" The ! makes us NOT jump to the first result automatically
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" =========================================================
" Key Bindings
" ------------
" This section should be used for ALL non-language-specific
" bindings. The leader key should be mapped in core config.
" =========================================================

" View the undo tree using the mundo plugin
nnoremap <leader>u :MundoToggle<CR>

" Save the current file if it has been updated:
nnoremap <leader>s :up<cr>

" Used with vim-ack
nnoremap <leader>a :Ack!

" Custom commands for moving around buffers
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bd :bd<cr>

" Git commands (key bindings for vim-fugitive)
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>ga :Git add %:p<cr><cr>

" Git Mergetool commands - accept remote, accept local
nnoremap <silent> <leader>mre :diffg RE
nnoremap <silent> <leader>mlo :diffg LO

" Use leader and / to clear search results
nmap <silent> <leader>/ :nohlsearch<CR>

" Remap tab to % in normal mode, allows movement among bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" =========================================================
" Lightline
" ---------
" Lightline is a plugin that manages the tabline -- this
" should give it a bit more power and fanciness.
" =========================================================
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
      \   'right': [ [ 'close' ], ],
      \ },
      \ 'component_expand': {
      \   'buffercurrent': 'lightline#buffer#buffercurrent2',
      \ },
      \ 'component_type': {
      \   'buffercurrent': 'tabsel',
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename',
      \   'bufferbefore': 'lightline#buffer#bufferbefore',
      \   'bufferafter': 'lightline#buffer#bufferafter',
      \   'bufferinfo': 'lightline#buffer#bufferinfo',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" lightline-buffer settings
let g:lightline_buffer_logo = ''
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '*'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' '

let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20
