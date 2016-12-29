set omnifunc=necoghc#omnifunc
let g:haskellmode_completion_ghc = 0
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:haskell_tabular = 1

" Leader bindings for GHC integration
" ==========================================
nnoremap <leader>hi :GhcModTypeInsert<cr>
nnoremap <leader>hs :GhcModSplitFunCase<cr>
nnoremap <leader>ht :GhcModType<cr>
nnoremap <leader>h/ :GhcModTypeClear<cr>
nnoremap <leader>hgs :GhcModCheck<cr>
nnoremap <leader>hcc :GhcModCheck<cr>
nnoremap <leader>hcl :GhcModLint<cr>

" Leader bindings for Hoogle integration
" ==========================================
nnoremap <silent> <leader>hh :Hoogle<CR>
nnoremap <leader>hH :Hoogle 
nnoremap <silent> <leader>hi :HoogleInfo<CR>
nnoremap <leader>hI :HoogleInfo 
nnoremap <silent> <leader>hz :HoogleClose<CR>

" Tabularize configuration for haskell
" These are commands in visual mode that will align to certain
" combinations of characters.
vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
