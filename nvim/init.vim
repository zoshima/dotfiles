let mapleader=" "

call plug#begin('~/.vim/plugged')
" project
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
"editor 
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
" looks
Plug 'morhetz/gruvbox'
" lsp
Plug 'neovim/nvim-lspconfig'
" syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" nvim-cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
call plug#end()

let g:netrw_liststyle = 1

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 60

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5,  'border': 'sharp' } }
let g:fzf_preview_window = ['up:80%', 'ctrl-h']

filetype plugin on

if (has("termguicolors"))
  set termguicolors
endif

set signcolumn=no
set number relativenumber

set expandtab
set tabstop=2
set shiftwidth=2

set splitbelow
set splitright

set pumheight=5 

set foldmethod=syntax
set nofoldenable

set noswapfile

set clipboard=unnamedplus

set completeopt=menuone,longest,noinsert,noselect

set hidden
set mouse=nvc

set fillchars=vert:\╎,stlnc:-,stl:-

" COLOR SCHEME
" gray      #7c6f64
" red       #fb4934
" green     #b8bb26
" yellow    #fabd2f
"
colorscheme gruvbox

hi SignColumn guibg=NONE
hi StatusLine guibg=NONE
hi CursorLineNr guibg=NONE
hi StatusLine guibg=0 guifg=#7c6f64 gui=NONE
hi StatusLineNC guibg=0 guifg=#7c6f64 gui=NONE
hi VertSplit guifg=#7c6f64
hi SignatureMarkText guibg=NONE guifg=#8ec081

hi LspDiagnosticsDefaultError guibg=NONE guifg=#fb4934
hi LspDiagnosticsSignError guibg=NONE guifg=#fb4934
hi LspDiagnosticsDefaultWarning guibg=NONE guifg=#fabd2f
hi LspDiagnosticsSignWarning guibg=NONE guifg=#fabd2f

hi Pmenu guibg=#3c3836 guifg=#bdae93

hi StatusLineFileName guibg=0 guifg=#fabd2f gui=NONE

" MAPPINGS
nnoremap * *``

nnoremap <Space> <Nop>

tnoremap <C-n> <C-\><C-n>

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

noremap <silent> <C-S-Left> :vertical resize +5<CR>
noremap <silent> <C-S-Right> :vertical resize -5<CR>
noremap <silent> <C-S-Up> :resize +5<CR>
noremap <silent> <C-S-Down> :resize -5<CR>

nnoremap <Space>p :GFiles<CR>
nnoremap <Space>P :Commands<CR>

nnoremap <Space>b :Buffers<CR>

nnoremap <Space>m :Marks<CR>

nnoremap <Space>C :Commits<CR>
nnoremap <Space>c :BCommits<CR>

nnoremap <Space>F :Ggrepc<Space>
nnoremap <Space>f :BLines<CR>

nnoremap <Space>t :TagbarToggle<CR>

nnoremap <silent><Space>e :call ToggleNERDTreeFind()<CR>
" nnoremap <silent><Space>e :E<CR>
nnoremap <Space>, :noh<CR>

" COMMANDS
command! -bang -nargs=* Ggrepc
			\ call fzf#vim#grep(
			\   'git grep --basic-regexp --line-number '.shellescape(<q-args>), 0,
			\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

command! -bang -nargs=1 Gcomp
      \ new | 0read ! git show <q-args>:#

command! -bang -nargs=0 Prettier
      \ %!prettier --stdin-filepath %

function! ToggleNERDTreeFind()
	if g:NERDTree.IsOpen() && bufwinnr(t:NERDTreeBufName) == winnr()
		execute ':NERDTreeClose'
	else
		execute ':NERDTreeFind'
	endif
endfunction

augroup QuickFixWindow
  " autocmd FileType qf nnoremap <buffer> <C-k> :ccl<CR>:lcl<CR>
  autocmd FileType qf nnoremap <buffer> <Esc> :ccl<CR>:lcl<CR>
augroup END

" lsp
luafile $HOME/git/dotfiles/nvim/lspconfig.lua

" statusline
luafile $HOME/git/dotfiles/nvim/statusline.lua

" treesitter
luafile $HOME/git/dotfiles/nvim/tsconfig.lua

" nvim-cmp
luafile $HOME/git/dotfiles/nvim/nvim-cmp.lua
