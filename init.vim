call plug#begin('~/.vim/plugged')
" project
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
"editor 
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-commentary'
" looks
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
" completion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" typescript
Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

let mapleader=" "

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 60

let g:gruvbox_contrast_dark = 'hard'
let g:one_allow_italics = 1

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [], [], ['readonly', 'modified', 'filename' ] ],
      \   'right': [ [], [], ['cocstatus'] ]
      \ },
      \ 'inactive': {
      \   'left': [ [], ['readonly', 'modified', 'filename' ] ],
      \   'right': [ [], [], [] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

filetype plugin on

colorscheme gruvbox

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
" set noshowmode
" set termguicolors

highlight clear SignColumn

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <Space>p :GFiles<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>F :GGrep<Space>
nnoremap <Space>f :BLines<Space>
nnoremap <Space>e :call ToggleNERDTreeFind()<CR>
nnoremap <Space>s :call SwitchAngularComponentBuffer()<CR>
nnoremap <Space>, :noh<CR>

nmap <leader>gh :call <SID>show_documentation()<CR>
nmap <leader>ga <Plug>(coc-codeaction)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>qf <Plug>(coc-fix-current)

" COMMANDS
command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
			\   'git grep --line-number '.shellescape(<q-args>), 0,
			\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" FUNCTIONS
function! ToggleNERDTreeFind()
	if g:NERDTree.IsOpen() && bufwinnr(t:NERDTreeBufName) == winnr()
		execute ':NERDTreeClose'
	else
		execute ':NERDTreeFind'
	endif
endfunction

function! SwitchAngularComponentBuffer()
  let file_name = expand("%:t") 

  if match(file_name, "^.*\.component\.[a-z]*$") != -1
    let file_extension = expand("%:e")
    let target_buffer = expand("%:t:r")

    if file_extension == "ts"
      let target_buffer = target_buffer . ".html"
    elseif file_extension == "html"
      let target_buffer = target_buffer . ".ts"
      " let target_buffer = target_buffer . ".scss"
    " elseif file_extension == "scss"
    "   let target_buffer = target_buffer . ".ts"
    else
      echo "SACB: unsupported file extension: " . file_extension
      return
    endif

    let target_file = expand("%:p:h") . "/" . target_buffer

    if bufnr(target_buffer) >= 0
      silent execute "buffer" bufnr(target_buffer)
    elseif filereadable(target_file)
      silent execute "edit" target_file
    else
      echo "SACB: file not found: " . target_file
    endif
  endif
endfunction

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
