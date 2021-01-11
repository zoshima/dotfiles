let g:OmniSharp_selector_ui = 'fzf'

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
  autocmd FileType cs nmap <silent> <buffer> <Leader>tf <Plug>(omnisharp_code_format)

  autocmd FileType cs nnoremap <buffer> <Leader>ge :OmniSharpGlobalCodeCheck<CR>

  " etc
  autocmd FileType cs nmap <silent> <buffer> <Leader>rn <Plug>(omnisharp_rename)
augroup END
