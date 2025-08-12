set number relativenumber 
set expandtab 
set tabstop=2 
set shiftwidth=0
set splitbelow 
set splitright 
set pumheight=5  
set completeopt=menuone,noselect,fuzzy 
set clipboard=unnamedplus
set hlsearch
set path=,,**/*
set incsearch
set signcolumn=number
set cursorline
set autoindent
set wildmenu wildoptions=pum
set noswapfile 
set viminfofile=NONE
set grepprg=rg\ --vimgrep\ -uu
set laststatus=2
set t_Co=16

nnoremap <Space>e :Ex<CR>
nnoremap <Space>p :find 
nnoremap <Space>f :grep 
nnoremap <Space>b :ls<CR>:b 
nnoremap <Space>co :bo copen<CR>
nnoremap <Space>cc :cclose<CR>
nnoremap <Space>lo :lopen<CR>
nnoremap <Space>lc :lclose<CR>

syntax on

" ~/.vim/colors/custom.vim
colorscheme custom
