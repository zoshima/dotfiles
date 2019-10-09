Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

set statusline=%r%m%t%=%{StatusDiagnostic()}

nmap <leader>gh :call <SID>show_documentation()<CR>
nmap <leader>ga <Plug>(coc-codeaction)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gf <Plug>(coc-fix-current)

nmap <leader>ce :CocList diagnostics<CR>
nmap <leader>co :CocList outline<CR>

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
