let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_timeout = 5
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_highlighting = 2
let g:OmniSharp_popup = 0

let g:ale_linters_explicit = 1
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

hi ALEErrorSign guibg=NONE guifg=#e75640
hi ALEWarningSign guibg=NONE guifg=#f1be4f

augroup omnisharp_commands
  autocmd!

  " core
  autocmd FileType cs nnoremap <buffer> <Leader>gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>ga :OmniSharpGetCodeActions<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>gh :OmniSharpDocumentation<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>gs :OmniSharpSignatureHelp<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>gr :OmniSharpFindUsages<CR>

  " syntax
  autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>tf :OmniSharpCodeFormat<CR>mzgg=G`z

  autocmd FileType cs nnoremap <buffer> <Leader>ge :OmniSharpGlobalCodeCheck<CR>
augroup END
