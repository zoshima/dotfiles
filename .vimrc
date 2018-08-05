filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" editor
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
" project
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'amiorin/vim-project'
" looks
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
" git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" syntax
Plugin 'w0rp/ale'
" autocomplete
" Plugin 'Valloric/YouCompleteMe'
" typescript
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'Quramy/tsuquyomi'
" c#
Bundle 'OmniSharp/omnisharp-vim'
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

colorscheme gruvbox

set nocompatible              " be iMproved, required
set splitbelow
set splitright
set background=dark
set number relativenumber
set ai
set cursorline
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set encoding=utf-8
set previewheight=5
set pumheight=5
set completeopt=longest,menuone
set hlsearch
set showcmd
set noswapfile
set wildignore+=*/node_modules/*,*/wwwroot/*,*/bin/*,*/obj/*
set rtp+=/usr/local/opt/fzf " fzf runtimepath

let mapleader = "\<Space>"

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

let g:airline_section_c = '%t%m'

let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_shortest_import_path = 1

let g:OmniSharp_server_path = '/Users/kdi/.omnisharp/omnisharp-roslyn/omnisharp/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_timeout = 5

let g:ale_linters = {
\   'cs': ['omnisharp'],
\   'typescript': ['tsserver','tslint'],
\   'html': [],
\   'css': [],
\   'scss': [],
\}
let g:ale_fixers = {
\   'cs': ['remove_trailing_lines','trim_whitespace'],
\   'typescript': ['prettier','tslint','remove_trailing_lines','trim_whitespace'],
\   'html': ['remove_trailing_lines','trim_whitespace'],
\   'css': ['prettier','remove_trailing_lines','trim_whitespace'],
\   'scss': ['prettier','remove_trailing_lines','trim_whitespace'],
\}
let g:ale_set_balloons = 0
let g:ale_fix_on_save = 1

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
map <Leader>, :noh<CR>

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

if has("gui_macvim") && has("gui_running")
  set langmenu=en_US.UTF-8
  set guifont=SFMono\ Nerd\ Font:h13 " mvim font
  set guioptions=
  set termguicolors
  set title titlestring=%F
  set noballooneval

  lan no_NO

  map <D-e> :call ToggleNERDTreeFind()<CR>
  map <D-E> :NERDTreeFind<CR>
  map <D-p> :GFiles<CR>
  map <D-b> :Buffers<CR>
  map <D-F> :GGrep<Space>
  map <D-f> :BLines<Space>

  nnoremap <D-l> <C-w>l
  nnoremap <D-h> <C-w>h
  nnoremap <D-j> <C-w>j
  nnoremap <D-k> <C-w>k

  nnoremap <D-1> 1gt
  nnoremap <D-2> 2gt
  nnoremap <D-3> 3gt
  nnoremap <D-4> 4gt
  nnoremap <D-5> 5gt

  autocmd FocusLost * redraw! " fixes fullscreen rendering issue
endif
 " 
 " augroup general_commands
 "   autocmd!
 " 
 "   autocmd CompleteDone * pclose
 " augroup END

augroup tsuquyomi_commands
  autocmd!

  " core
  autocmd FileType typescript nnoremap <buffer> <Leader>gh : <C-u>echo tsuquyomi#hint()<CR>
  autocmd FileType typescript nnoremap <buffer> <F2> :TsuRenameSymbol<CR>
  autocmd FileType typescript nnoremap <buffer> gd :TsuDefinition<CR>
  autocmd FileType typescript nnoremap <buffer> <Leader>x :TsuQuickFix<CR>
  autocmd FileType typescript nnoremap <buffer> <Leader>ga :TsuImport<CR>
augroup END

augroup omnisharp_commands
  autocmd!

  " core
  autocmd FileType cs nnoremap <buffer> <Leader>gt :OmniSharpTypeLookup<CR>
  autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs noremap <buffer> <Leader>ga :OmniSharpGetCodeActions<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>gh :OmniSharpDocumentation<CR>
  autocmd FileType cs noremap <buffer> <Leader>gs :OmniSharpSignatureHelp<CR>
  autocmd FileType cs nnoremap <buffer> <F2> :OmniSharpRename<CR>

  " search
  autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

  " server
  autocmd FileType cs nnoremap <buffer> <Leader>ss :OmniSharpStartServer<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>sp :OmniSharpStopServer<CR>

  " syntax
  autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>
augroup END

" fzf search git file content
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" toggle nerdtree on current file 
function! ToggleNERDTreeFind()
  if g:NERDTree.IsOpen() && bufwinnr(t:NERDTreeBufName) == winnr()
    execute ':NERDTreeClose'
  else
    execute ':NERDTreeFind'
  endif
endfunction

" projects
let g:project_use_nerdtree = 1
set rtp+=~/.vim/bundle/vim-project/
call project#rc("~/git")

Project 'betr'
Project 'kyoiku'
Project 'node-ts'
Project 'csconsole'
Project 'game'

File     '~/.vimrc', 'vimrc'
