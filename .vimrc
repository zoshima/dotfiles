filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" essential
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
Plugin 'haya14busa/incsearch.vim'
" sugar
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'prettier/prettier'
Plugin 'joshdick/onedark.vim'
" typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
" c#
Plugin 'OrangeT/vim-csharp'
Plugin 'OmniSharp/omnisharp-vim'
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

set nocompatible              " be iMproved, required
set splitright
set number relativenumber
set ai
set tabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set encoding=utf-8
set previewheight=5
set pumheight=5
set completeopt=longest,menuone,preview
set hlsearch
set showcmd
set noswapfile
set ballooneval
set wildignore+=*/node_modules/*,*/wwwroot/*,*/bin/*,*/obj/*
set rtp+=/usr/local/opt/fzf " fzf runtimepath

let mapleader = "\<Space>"

let g:OmniSharp_server_path = '/Users/kdi/omnisharp/omnisharp.http-osx/omnisharp/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_prefer_global_sln = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

let g:ctrlp_by_filename = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_cs_checkers = ['code_checker']
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_disable_quickfix = 1

let g:airline_theme='onedark'

nnoremap <esc> :noh<return><esc>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

if has("gui_macvim") && has("gui_running")
  set guifont=SFMono\ Nerd\ Font:h13 " mvim font
  set termguicolors

  let g:airline_powerline_fonts = 1

  colorscheme onedark

  map <D-E> :NERDTreeFind<CR>
  map <D-e> :NERDTreeToggle<CR>
  map <D-p> :GFiles<CR>
  map <D-B> :Buffers<CR>
endif

augroup general_commands
  autocmd!

  autocmd CompleteDone * pclose " close preview when completion is finished
  autocmd BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif
augroup END

augroup tsuquyomi_commands
  autocmd!

  " core
  autocmd FileType typescript nnoremap <buffer> <Leader>tt : <C-u>echo tsuquyomi#hint()<CR>
  autocmd FileType typescript nnoremap <buffer> <F2> :TsuRenameSymbol<CR>
  autocmd FileType typescript nnoremap <buffer> gd :TsuDefinition<CR>
  autocmd FileType typescript nnoremap <buffer> <Leader>x :TsuQuickFix<CR>
  autocmd FileType typescript nnoremap <buffer> <Leader>i :TsuImport<CR>
augroup END

augroup omnisharp_commands
  autocmd!

  autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
  autocmd BufWritePost *.cs call OmniSharp#AddToProject()

  " core
  autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
  autocmd FileType cs nnoremap <buffer> <F2> :OmniSharpRename<CR>
  autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>x :OmniSharpFixIssue<CR>
  autocmd FileType cs noremap <buffer> <Leader><Space> :OmniSharpGetCodeActions<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

  " search
  autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
augroup END

" fzf search git file content
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
