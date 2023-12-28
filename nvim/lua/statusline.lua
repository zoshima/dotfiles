vim.api.nvim_command("au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')")
vim.api.nvim_command("au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')")

function Statusline(mode)
  local stl = "-"
  local filename = "[%t]"
  local location = "[%l:%c]"
  local left = "%r%m"
  local right = ""

  local function tableLen(t)
    local n = 0

    for _ in ipairs(t) do
      n = n + 1
    end

    return n
  end

  if mode == "active" then
    filename = "%#StatusLineFileName#" .. filename .. "%*"

    if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
      local clients = vim.lsp.buf_get_clients(0)

      local errs = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      local warns = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

      local num_errs = tableLen(errs)
      local num_warns = tableLen(warns)

      if num_errs > 0 then
        right = right .. "[%#DiagnosticError#" .. num_errs .. "e%*]"
      end

      if num_warns > 0 then
        right = right .. "[%#DiagnosticWarn#" .. num_warns .. "w%*]"
      end

      for _, v in ipairs(clients) do
        right = right .. "[" .. v.name .. "]"
      end
    end
  end

  return string.format("%s%s%s[%s]%s%s%s%s", stl, left, filename, vim.fn.mode(), location, "%=", right, stl);
end
