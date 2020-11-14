let g:coc_global_extensions=[ 'coc-prettier', 'coc-eslint', 'coc-tsserver', 'coc-json', 'coc-css' ]

set statusline=%r%m%t%=%{StatusDiagnostic()}

hi CocErrorSign guibg=NONE guifg=#e75640
hi CocWarningSign guibg=NONE guifg=#f1be4f

" documentation in preview
nnoremap <silent> <leader>gh :call <SID>show_documentation()<CR>

nmap <silent> <leader>ga <Plug>(coc-codeaction)
nmap <silent> <leader>gf <Plug>(coc-fix-current)

" goto
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)

" diagnostics
nnoremap <silent> <leader>ce :CocList diagnostics<CR>
nnoremap <silent> <leader>co :CocList outline<CR>

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
