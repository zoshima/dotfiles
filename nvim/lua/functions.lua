function ShowHighlightInfo()
  local result = vim.treesitter.get_captures_at_cursor(0)
  print(vim.inspect(result))
end

function CopyFilePath()
  local file_path = vim.fn.expand('%:p')
  vim.fn.setreg('+', file_path)
end
