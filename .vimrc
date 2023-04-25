let mapleader=" "

set relativenumber
set rnu
set scrolloff=8
set incsearch
set smartindent
set wrap! 
set expandtab 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set undofile
"Mappings
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
map <C-s> :w<CR>
nnoremap J mzJ'z
"nmap <leader>pv :Ex<CR>
nnoremap <C-c> <Esc>
vmap J :m'>+1<CR>gv=gv
vmap K :m'<-2<CR>gv=gv
" quickfix
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz
vnoremap " c""<C-c>P
vnoremap ( c()<C-c>P
vnoremap { c{}<C-c>P
vnoremap [ c[]<C-c>P
vnoremap ' c''<C-c>P
vnoremap ` c``<C-c>P

" Register remaps
vnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y
nnoremap <leader>d "_d
vnoremap <leader>d "_d































