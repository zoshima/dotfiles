nnoremap <silent> <leader>ga <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>

nnoremap <silent> <leader>gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>gH <cmd>lua vim.lsp.buf.signature_help()<CR>

nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.references()<CR>

nnoremap <silent> <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>

nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
