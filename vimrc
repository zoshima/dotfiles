syntax on
highlight clear

set number relativenumber 
set expandtab 
set tabstop=2 
set shiftwidth=0
set splitbelow 
set splitright 
set pumheight=5  
set completeopt=menuone,noselect,fuzzy 
set clipboard=unnamedplus
set hlsearch
set path=,,**/*
set incsearch
set signcolumn=number
set cursorline
set autoindent
set wildmenu wildoptions=pum
set noswapfile 
set viminfofile=NONE
set grepprg=rg\ --vimgrep\ -uu
set laststatus=2
set t_Co=16

" mappings
nnoremap <Space>e :Ex<CR>
nnoremap <Space>p :find 
nnoremap <Space>f :grep 
nnoremap <Space>b :ls<CR>:b 
nnoremap <Space>co :bo copen<CR>
nnoremap <Space>cc :cclose<CR>
nnoremap <Space>lo :lopen<CR>
nnoremap <Space>lc :lclose<CR>
nnoremap <silent> <C-L> :nohlsearch<CR>

" functions
function! SynStack ()
  let s = synID(line('.'), col('.'), 1) | echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
endfunc
command Inspect call SynStack()

" augroups
augroup syntax
  autocmd!
  autocmd FileType go syntax match goFunction "\<\k\+\ze("
augroup END

" colorscheme
let g:colors_name = 'custom'
" :h group-name
hi Comment ctermfg=Gray ctermbg=NONE cterm=NONE
hi Constant ctermfg=Green ctermbg=NONE cterm=NONE
hi Identifier ctermfg=Yellow ctermbg=NONE cterm=NONE
hi Statement ctermfg=Red ctermbg=NONE cterm=NONE
hi PreProc ctermfg=Blue ctermbg=NONE cterm=NONE
hi Type ctermfg=Cyan ctermbg=NONE cterm=NONE
hi Special ctermfg=Magenta ctermbg=NONE cterm=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
hi Added ctermfg=Green ctermbg=NONE cterm=NONE
hi Changed ctermfg=Yellow ctermbg=NONE cterm=NONE
hi Removed ctermfg=Red ctermbg=NONE cterm=NONE
hi Ignore ctermfg=DarkGray ctermbg=NONE cterm=NONE
hi Error ctermfg=Red ctermbg=NONE cterm=NONE
hi Todo ctermfg=Magenta ctermbg=NONE cterm=NONE
" :h highlight-groups
hi Normal ctermfg=White ctermbg=NONE cterm=NONE
hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi Directory ctermfg=Blue ctermbg=NONE cterm=bold 
hi LineNr ctermfg=DarkGray ctermbg=NONE cterm=NONE 
hi CursorLineNr ctermfg=White ctermbg=NONE cterm=NONE 
hi MatchParen ctermfg=NONE ctermbg=DarkGray cterm=NONE 
hi Pmenu ctermfg=NONE ctermbg=Black cterm=NONE 
hi PmenuSel ctermfg=NONE ctermbg=NONE cterm=reverse 
hi PmenuMatch ctermfg=Brown ctermbg=NONE cterm=NONE 
hi QuickFixLine ctermfg=Brown ctermbg=NONE cterm=NONE 
hi VertSplit ctermfg=DarkGray ctermbg=NONE cterm=NONE 
hi Search ctermfg=NONE ctermbg=NONE cterm=reverse 
hi CurSearch ctermfg=Black ctermbg=Brown cterm=NONE 
hi! link IncSearch CurSearch
hi StatusLine ctermfg=White ctermbg=Black cterm=NONE 
hi StatusLineNC ctermfg=DarkGray ctermbg=Black cterm=NONE 
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabLine StatusLine
hi! link TabLineFill StatusLineNC
hi Title ctermfg=White ctermbg=NONE cterm=NONE
hi NonText ctermfg=DarkGray ctermbg=NONE cterm=NONE
hi Visual ctermfg=NONE ctermbg=NONE cterm=reverse
hi! link ErrorMsg Error
