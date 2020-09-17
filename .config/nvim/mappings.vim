" screen line movement
noremap j gj
noremap k gk

" auto close
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>
inoremap {<cr> {<cr>}<esc>O
inoremap {;<cr> {<cr>};<esc>O

" hh == esc
inoremap hh <esc>

" ; == :
map ; :

" save and quit
nm <leader>w :w!<cr>
nm <leader>q :wq!<cr>
nm <leader>qq :q!<cr>

" shift key fixes
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" remove search highlight
noremap <leader><space> <esc>:noh<cr><esc>

" reload nvim config
nmap <leader>r :so ~/.config/nvim/init.vim<cr>
