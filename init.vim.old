call plug#begin('~/.vim/plugged')
" project
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
"editor 
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-commentary'
" looks
Plug 'morhetz/gruvbox'
" syntax
Plug 'w0rp/ale'
" typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
call plug#end()

" map <Space> \
let mapleader=" "

let g:gruvbox_contrast_dark = 'hard'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 60

let g:nvim_typescript#diagnostics_enable = 0

let g:ale_linters = {
\   'typescript': ['tsserver','tslint'],
\   'html': [],
\   'css': [],
\   'scss': [],
\}
let g:ale_fixers = {
\   'typescript': ['prettier','tslint','remove_trailing_lines','trim_whitespace'],
\   'html': ['remove_trailing_lines','trim_whitespace'],
\   'css': ['prettier','remove_trailing_lines','trim_whitespace'],
\   'scss': ['prettier','remove_trailing_lines','trim_whitespace'],
\}
let g:ale_set_balloons = 0
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '❗️' 
let g:ale_sign_warning = '❕' 

filetype plugin on
colorscheme gruvbox

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

nmap <Leader>an :ALENext<CR>
nmap <Leader>ap :ALEPrevious<CR>

" COMMANDS
augroup typescript
  autocmd!

  autocmd FileType typescript nnoremap <buffer> gh :ALEHover<CR>
  autocmd FileType typescript nnoremap <buffer> gd :ALEGoToDefinition<CR>
  autocmd FileType typescript nnoremap <buffer> gf :ALEFindReferences<CR>
  autocmd FileType typescript nnoremap <buffer> <Leader>ga :TSImport<CR>
augroup END

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
