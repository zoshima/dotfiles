call plug#begin('~/.vim/plugged')
" project
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
"editor 
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-commentary'
" looks
Plug 'morhetz/gruvbox'
" completion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" typescript
Plug 'HerringtonDarkholme/yats.vim'
" dart
Plug 'dart-lang/dart-vim-plugin'
" typescript
Plug 'HerringtonDarkholme/yats.vim'
" c#
Plug 'OmniSharp/omnisharp-vim'
" lint
Plug 'w0rp/ale'
call plug#end()

let mapleader=" "

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 60

let g:gruvbox_contrast_dark = 'hard'

filetype plugin on

colorscheme gruvbox

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
set termguicolors
set statusline=%r%m%t%=%{StatusDiagnostic()}
set fillchars=vert:\¦,stlnc:-,stl:-
set mouse=a
set updatetime=300
set shortmess+=c
set incsearch

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_timeout = 5
let g:OmniSharp_highlight_types = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

hi SignColumn guibg=NONE
hi StatusLine guibg=NONE
hi CursorLineNr guibg=NONE
hi StatusLine guibg=0 guifg=#fabd2f gui=NONE
hi StatusLineNC guibg=0 guifg=#7c6f64 gui=NONE
hi VertSplit guifg=#7c6f64

hi ALEErrorSign guibg=NONE guifg=#e75640
hi ALEWarningSign guibg=NONE guifg=#f1be4f

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
nmap <leader>gf <Plug>(coc-fix-current)

nmap <leader>ce :CocList diagnostics<CR>
nmap <leader>co :CocList outline<CR>

" COMMANDS
command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
			\   'git grep --basic-regexp --line-number '.shellescape(<q-args>), 0,
			\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

augroup omnisharp_commands
  autocmd!

  autocmd BufEnter *.cs call OmniSharp#HighlightBuffer()

  " core
  autocmd FileType cs nnoremap <buffer> <Leader>gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>ga :OmniSharpGetCodeActions<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>gh :OmniSharpDocumentation<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>gs :OmniSharpSignatureHelp<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>gr :OmniSharpFindUsages<CR>

  " syntax
  autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>tf :OmniSharpCodeFormat<CR>mzgg=G`z
augroup END

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
      " let target_buffer = target_buffer . ".ts"
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

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []

  if get(info, 'error', 0)
    call add(msgs, '[E:' . info['error'] . ']')
  endif

  if get(info, 'warning', 0)
    call add(msgs, '[W:' . info['warning'] . ']')
  endif

  return join(msgs, ''). '' . get(g:, 'coc_status', '')
endfunction
