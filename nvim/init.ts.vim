nnoremap <Space>s :call SwitchAngularComponentBuffer()<CR>

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
