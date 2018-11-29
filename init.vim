call plug#begin('~/.vim/plugged')
" project
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
"editor 
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
" looks
Plug 'morhetz/gruvbox'
" syntax
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim'
" typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" c#
Plug 'OmniSharp/omnisharp-vim'
call plug#end()

let g:gruvbox_contrast_dark = 'hard'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 60

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_timeout = 5

let g:nvim_typescript#diagnostics_enable = 0

let g:deoplete#enable_at_startup = 1

let g:ale_linters = {
\   'cs': ['OmniSharp'],
\   'typescript': ['tsserver','tslint'],
\   'html': [],
\   'css': [],
\   'scss': [],
\}
let g:ale_fixers = {
\   'cs': ['prettier','remove_trailing_lines','trim_whitespace'],
\   'typescript': ['prettier','tslint','remove_trailing_lines','trim_whitespace'],
\   'html': ['remove_trailing_lines','trim_whitespace'],
\   'css': ['prettier','remove_trailing_lines','trim_whitespace'],
\   'scss': ['prettier','remove_trailing_lines','trim_whitespace'],
\}
let g:ale_set_balloons = 0
let g:ale_fix_on_save = 1

filetype plugin on
colorscheme gruvbox

set background=dark
set number relativenumber
set cursorline
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

map <Space> \

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <Space>p :GFiles<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>F :GGrep<Space>
nnoremap <Space>f :BLines<Space>
nnoremap <Space>e :call ToggleNERDTreeFind()<CR>
nnoremap <Space>, :noh<CR>

nmap <Leader>hv <Plug>GitGutterPreviewHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>hn <Plug>GitGutterNextHunk

nmap <Leader>an :ALENext<CR>
nmap <Leader>ap :ALEPrevious<CR>

tnoremap <Esc> <C-\><C-n>

" COMMANDS
command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
			\   'git grep --line-number '.shellescape(<q-args>), 0,
			\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

augroup nvimts_commands
  autocmd!

  autocmd FileType typescript set omnifunc=TSComplete
  autocmd FileType typescript nnoremap <buffer> <Leader>gh :TSType<CR>
  autocmd FileType typescript nnoremap <buffer> gd :TSDef<CR>
  autocmd FileType typescript nnoremap <buffer> <Leader>ga :TSImport<CR>
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
