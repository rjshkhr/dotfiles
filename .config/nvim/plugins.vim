" plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" coc extentions
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-eslint',
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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" coc prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>p :Prettier<cr>

" emmet vim
let g:user_emmet_mode='inv'
let g:user_emmet_leader_key=','

" gruvbox
" let g:gruvbox_italic = 1
" colorscheme gruvbox

" nord
let g:nord_italic = 1
colorscheme nord

" dracula
" let g:dracula_colorterm = 0
" colorscheme dracula
" hi LineNr ctermfg=8
" hi CursorLine cterm=NONE ctermbg=8
" hi CursorLineNr ctermbg=8 ctermfg=6 cterm=BOLD


" fzf
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
