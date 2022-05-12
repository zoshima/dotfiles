vim.api.nvim_command("au WinEnter,BufEnter * setlocal statusline=%!v:lua.statusline('active')")
vim.api.nvim_command("au WinLeave,BufLeave * setlocal statusline=%!v:lua.statusline('inactive')")

function _G.statusline(mode)
  local filename = "%t"
  local location = "[%l:%c]"
  local left = "%r%m"
  local right = ""

  local function tableLen(table)
    local n = 0

    for _ in pairs(table) do
      n = n + 1
    end

    return n
  end

  if mode == "active" then
    filename = "%#StatusLineFileName#" .. filename .. "%#StatusLine#"

    if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
      local clients = vim.lsp.buf_get_clients(0)

      local errs = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      local warns = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

      local num_errs = tableLen(errs)
      local num_warns = tableLen(warns)

      if num_errs > 0 then
        right = right .. "[%#LspDiagnosticsSignError#" .. num_errs .. "e%#StatusLine#]"
      end

      if num_warns > 0 then
        right = right .. "[%#LspDiagnosticsSignWarning#" .. num_warns .. "w%#StatusLine#]"
      end

      for _, v in ipairs(clients) do
        right = right .. "["..v.name.."]"
      end
    end
  end

  return string.format("%s[%s]%s%s%s", left, filename, location, "%=", right .. "");
end
