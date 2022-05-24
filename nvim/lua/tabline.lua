vim.api.nvim_command("set tabline=%!v:lua.tabline()")

function _G.tabline()
  local tabline = ""

  for index = 1, vim.fn.tabpagenr('$') do
    local winnr = vim.fn.tabpagewinnr(index)
    local buflist = vim.fn.tabpagebuflist(index)
    local bufnr = buflist[winnr]
    local bufmodified = vim.fn.getbufvar(bufnr, '&mod')
    local mod = ""

    -- id
    if index == vim.fn.tabpagenr() then
      tabline = tabline .. '%#TabLineSel#'
    else
      tabline = tabline .. '%#TabLine#'
    end

    -- mod
    if bufmodified == 1 then
      mod = "+"
    end

    -- index
    tabline = string.format("%s[%s%s] ", tabline, index, mod)

    -- name
    tabline = tabline .. "%t "
  end

  tabline = tabline .. "%#TabLineFill#"

  return string.format("%s", tabline)
end
