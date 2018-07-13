filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" essential
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'mileszs/ack.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
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
set completeopt=longest,menuone,preview
set hlsearch
set showcmd
set noswapfile
set ballooneval
set wildignore+=*/node_modules/*,*/wwwroot/*,*/bin/*,*/obj/*
set rtp+=/usr/local/opt/fzf " fzf runtimepath

if has("gui_macvim") && has("gui_running")
  set guifont=SFMono\ Nerd\ Font:h13 " mvim font
  set termguicolors
  let g:airline_powerline_fonts = 1
  colorscheme onedark

  map <D-E> :NERDTreeFind<CR>
  map <D-e> :NERDTreeToggle<CR>
  map <D-p> :FZF ~/git/betr/<CR>

" map <D-h> <C-w>h
" map <D-j> <C-w>j
" map <D-k> <C-w>k
" map <D-l> <C-w>l
" map <D-H> <C-w>H
" map <D-J> <C-w>J
" map <D-K> <C-w>K
" map <D-L> <C-w>L
endif

let mapleader = "\<Space>"

let g:OmniSharp_server_path = '/Users/kdi/omnisharp/omnisharp.http-osx/omnisharp/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_prefer_global_sln = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1

let g:ctrlp_by_filename = 1

let g:ackprg = 'ag --vimgrep'

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_cs_checkers = ['code_checker']
let g:syntastic_typescript_checkers = ['tsuquyomi']

let g:airline_theme='onedark'

let $FZF_DEFAULT_COMMAND='ag -l -s -o -g ""'

autocmd CompleteDone * pclose " close preview when completion is finished
autocmd BufEnter * if &ft !~ '^nerdtree$' | silent! lcd %:p:h | endif

function! ToggleNERDTreeFind()
  if g:NERDTree.IsOpen()
    execute ':NERDTreeClose'
  else
    execute ':NERDTreeFind'
  endif
endfunction

" tsuquomi
augroup tsuquyomi_commands
  autocmd!

  autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()

  autocmd FileType typescript nmap <buffer> <Leader>tt : <C-u>echo tsuquyomi#hint()<CR>
  autocmd FileType typescript nnoremap <buffer> <Leader><Space> :TsuImport<CR>
augroup END

" omnisharp
augroup omnisharp_commands
    autocmd!

    " Automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>

    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs noremap <Leader><Space> :OmniSharpGetCodeActions<CR>

    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs noremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

    " Force OmniSharp to reload the solution. Useful when switching branches etc.
    autocmd FileType cs nnoremap <Leader>rl :OmniSharpReloadSolution<CR>

    " Load the current .cs file to the nearest project
    autocmd FileType cs nnoremap <Leader>tp :OmniSharpAddToProject<CR>

    " Add syntax highlighting for types and interfaces
    autocmd FileType cs nnoremap <Leader>th :OmniSharpHighlightTypes<CR>
augroup END
