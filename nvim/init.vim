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

set fillchars=vert:\¦,stlnc:-,stl:-

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

nnoremap ga <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gH <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap gn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gf <cmd>lua vim.lsp.buf.formatting()<CR>

vnoremap gf <cmd>lua vim.lsp.buf.range_formatting()<CR>

nnoremap z/ <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap zn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap zp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap zh <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

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

function! SwitchHeaderSource()
  let file_extension = expand("%:e")

  if file_extension == "h" || file_extension == "cpp"
    let target_buffer = expand("%:t:r")

    if file_extension == "cpp"
      let target_buffer = target_buffer . ".h"
    elseif file_extension == "h"
      let target_buffer = target_buffer . ".cpp"
    endif

    if bufnr(target_buffer) >= 0
      silent execute "buffer" bufnr(target_buffer)
    else 
      let project_dir = trim(system("git rev-parse --show-toplevel"))
      let find_cmd = printf("find %s -name \"%s\" | grep -m1 .", project_dir, target_buffer)
      let target_file = trim(system(find_cmd))

      if len(target_file) != 0 && filereadable(target_file)
        silent execute "edit" target_file
      else
        echo "File not found: " . target_buffer
      endif
    endif
  endif
endfunction

function! SwitchTemplateComponent()
  let file_name = expand("%:t") 

  echo file_name

  if match(file_name, "^.*\.component\.[a-z]*$") != -1
    let file_extension = expand("%:e")
    let target_buffer = expand("%:t:r")

    if file_extension == "ts"
      let target_buffer = target_buffer . ".html"
    elseif file_extension == "html"
      let target_buffer = target_buffer . ".ts"
      " let target_buffer = target_buffer . ".scss"
    " elseif file_extension == "scss"
      " let target_buffer = target_buffer . ".ts"
    else
      echo "Unsupported file extension: " . file_extension
      return
    endif

    let target_file = expand("%:p:h") . "/" . target_buffer

    if bufnr(target_buffer) >= 0
      silent execute "buffer" bufnr(target_buffer)
    elseif filereadable(target_file)
      silent execute "edit" target_file
    else
      echo "File not found: " . target_file
    endif
  endif
endfunction

" AU
" autocmd BufEnter * lua require'completion'.on_attach()

autocmd FileType typescript,html nnoremap <silent><Space>s :call SwitchTemplateComponent()<CR>
autocmd FileType cpp nnoremap <silent><Space>s :call SwitchHeaderSource()<CR>

augroup QuickFixWindow
  " autocmd FileType qf nnoremap <buffer> <C-k> :ccl<CR>:lcl<CR>
  autocmd FileType qf nnoremap <buffer> <Esc> :ccl<CR>:lcl<CR>
augroup END

augroup StatusLine 
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.statusline('active')
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.statusline('inactive')
augroup END

lua << EOF
function _G.statusline(mode)
  local filename = '%t'
  local location = '[%l:%c]'
  local left = '%r%m'
  local right = ''

  if mode == 'active' then
    filename = '%#StatusLineFileName#' .. filename .. '%#StatusLine#'

    if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
      local clients = vim.lsp.buf_get_clients(0)

      local num_errs = vim.lsp.diagnostic.get_count(0, [[Error]])
      local num_warns = vim.lsp.diagnostic.get_count(0, [[Warning]])

      if num_errs > 0 then
        right = right .. '[%#LspDiagnosticsSignError#' .. num_errs .. 'e%#StatusLine#]'
      end

      if num_warns > 0 then
        right = right .. '[%#LspDiagnosticsSignWarning#' .. num_warns .. 'w%#StatusLine#]'
      end

      for k, v in ipairs(clients) do
        right = right .. '['..v.name..']'
      end
    end
  end

  return string.format('-%s[%s]%s%s%s', left, filename, location, '%=', right .. '-');
end
EOF

" lsp
luafile $HOME/git/dotfiles/nvim/lspconfig.lua

" treesitter
luafile $HOME/git/dotfiles/nvim/tsconfig.lua

set exrc secure
