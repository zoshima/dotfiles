set statusline=%r%m%t%=%{StatusDiagnostic()}

nnoremap <leader>gh :call <SID>show_documentation()<CR>
nnoremap <leader>ga <Plug>(coc-codeaction)
nnoremap <leader>gd <Plug>(coc-definition)
nnoremap <leader>gy <Plug>(coc-type-definition)
nnoremap <leader>gi <Plug>(coc-implementation)
nnoremap <leader>gr <Plug>(coc-references)
nnoremap <leader>gf <Plug>(coc-fix-current)
nnoremap <leader>ce :CocList diagnostics<CR>
nnoremap <leader>co :CocList outline<CR>

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
