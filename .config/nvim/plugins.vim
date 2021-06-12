" plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
call plug#end()

" coc extentions
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-tsserver'
  \ ]

" coc tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc snippets completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" coc prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" emmet vim
let g:user_emmet_mode='inv'

" " gruvbox
let g:gruvbox_italic = 1
colorscheme gruvbox

" fzf
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
