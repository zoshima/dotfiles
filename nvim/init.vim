let mapleader=" "

call plug#begin('~/.vim/plugged')
" project
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
"editor 
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'
" looks
Plug 'morhetz/gruvbox'
" lsp
Plug 'neovim/nvim-lspconfig'
call plug#end()

let g:netrw_banner = 0
let g:netrw_liststyle = 1

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5,  'border': 'sharp' } }

filetype plugin on

if (has("termguicolors"))
  set termguicolors
endif

set signcolumn=yes
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

set clipboard=unnamed

set completeopt=menuone,longest,noinsert,noselect

set hidden
set mouse=nvc

set fillchars=vert:\¦,stlnc:-,stl:-
set statusline=%!v:lua.statusline()

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
hi StatusLine guibg=0 guifg=#fabd2f gui=NONE
hi StatusLineNC guibg=0 guifg=#7c6f64 gui=NONE
hi VertSplit guifg=#7c6f64
hi SignatureMarkText guibg=NONE guifg=#8ec081

" MAPPINGS
nnoremap * *``

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
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>F :ggrep<Space>
nnoremap <Space>f :BLines<CR>
nnoremap <silent><Space>e :E<CR>
nnoremap <Space>, :noh<CR>

nnoremap ga <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gH <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap gf <cmd>lua vim.lsp.buf.formatting()<CR>

" COMMANDS
command! -bang -nargs=* Ggrep
			\ call fzf#vim#grep(
			\   'git grep --basic-regexp --line-number '.shellescape(<q-args>), 0,
			\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

command! -bang -nargs=1 Gcomp
      \ new | 0read ! git show <q-args>:#

command! -bang -nargs=0 Prettier
      \ %!prettier --stdin-filepath %

lua << EOF
function _G.statusline()
  local left = '%r%m%t'
  local right = ''

  if not vim.tbl_isempty(vim.lsp.buf_get_clients()) then
    local clients = vim.lsp.buf_get_clients()

    for k, v in ipairs(clients) do
      right = right .. '['..v.name..']'
    end
  end

  return string.format('%s%s%s', left, '%=', right);
end
EOF

" lsp
luafile $HOME/git/dotfiles/nvim/lspconfig.lua
