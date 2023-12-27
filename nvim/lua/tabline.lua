function Tabline()
  local tabline = {}
  for i = 1, vim.fn.tabpagenr('$') do
    local tab_label = string.format(
      "[%d] %s",
      i,
      vim.fn.fnamemodify(vim.fn.bufname(vim.fn.tabpagebuflist(i)[1]), ":t")
    )

    local is_current = i == vim.fn.tabpagenr()
    if is_current then
      tab_label = '%#TabLineSel#' .. tab_label .. '%*'
    end

    table.insert(tabline, tab_label)
  end

  return table.concat(tabline, ' | ')
end

vim.o.tabline = '%!v:lua.Tabline()'
