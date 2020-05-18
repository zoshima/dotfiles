let mapleader=" "

call plug#begin('~/.vim/plugged')
" project
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
"editor 
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-commentary'
" looks
Plug 'morhetz/gruvbox'
" coc
if !empty(glob("$HOME/.config/nvim/init.coc.vim"))
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
" ts
if !empty(glob("$HOME/.config/nvim/init.ts.vim"))
  Plug 'HerringtonDarkholme/yats.vim'
endif
" cs
if !empty(glob("$HOME/.config/nvim/init.cs.vim"))
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'w0rp/ale', { 'for': 'cs' }
endif
call plug#end()

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 60

let g:gruvbox_contrast_dark = 'hard'

filetype plugin on

colorscheme gruvbox

set termguicolors
set autoread
set signcolumn=yes
set background=dark
set number relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
set splitbelow
set splitright
set previewheight=5
set pumheight=5 
set foldmethod=syntax
set nofoldenable
set noswapfile
set clipboard=unnamed
set completeopt=menu,longest
set hidden
set mouse=a
set updatetime=300
set shortmess+=c
set incsearch
set fillchars=vert:\¦,stlnc:-,stl:-
set statusline=%r%m%t%=

" colors
" gray      #7c6f64
" red       #fb4934
" green     #b8bb26
" yellow    #fabd2f

hi SignColumn guibg=NONE
hi StatusLine guibg=NONE
hi CursorLineNr guibg=NONE
hi StatusLine guibg=0 guifg=#fabd2f gui=NONE
hi StatusLineNC guibg=0 guifg=#7c6f64 gui=NONE
hi VertSplit guifg=#7c6f64

hi GitGutterAdd guibg=0 guifg=#b8bb26
hi GitGutterChange guibg=0 guifg=#fabd2f
hi GitGutterDelete guibg=0 guifg=#fb4934
hi GitGutterChangeDelete guibg=0

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

noremap <silent> <C-S-Left> :vertical resize +5<CR>
noremap <silent> <C-S-Right> :vertical resize -5<CR>
noremap <silent> <C-S-Up> :resize +5<CR>
noremap <silent> <C-S-Down> :resize -5<CR>

nnoremap <Space>p :GFiles<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>F :GGrep<Space>
nnoremap <Space>f :BLines<Space>
nnoremap <Space>e :call ToggleNERDTreeFind()<CR>
nnoremap <Space>, :noh<CR>

tnoremap <C-n> <C-\><C-n>

" COMMANDS
command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
			\   'git grep --basic-regexp --line-number '.shellescape(<q-args>), 0,
			\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" FUNCTIONS
function! ToggleNERDTreeFind()
	if g:NERDTree.IsOpen() && bufwinnr(t:NERDTreeBufName) == winnr()
		execute ':NERDTreeClose'
	else
		execute ':NERDTreeFind'
	endif
endfunction

" SOURCES
" ts
if !empty(glob("$HOME/.config/nvim/init.ts.vim"))
  source $HOME/.config/nvim/init.ts.vim
endif
" cs
if !empty(glob("$HOME/.config/nvim/init.cs.vim"))
  source $HOME/.config/nvim/init.cs.vim
endif
" coc
if !empty(glob("$HOME/.config/nvim/init.coc.vim"))
  source $HOME/.config/nvim/init.coc.vim
endif
