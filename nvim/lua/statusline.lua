vim.api.nvim_command("au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')")
vim.api.nvim_command("au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')")

function Statusline(mode)
  local filename = "%t"
  local location = "%l:%c"
  local state = "%r%m"
  local diagnostics = ""
  local context = ""

  if mode == "active" then
    filename = "%#StatusLineFileName#" .. filename .. "%*"

    if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
      local clients = vim.lsp.buf_get_clients(0)

      local num_diagnostics = vim.diagnostic.count(0, { severity = {
        vim.diagnostic.severity.ERROR,
        vim.diagnostic.severity.WARN
      } })

      local num_errs = num_diagnostics[vim.diagnostic.severity.ERROR]
      local num_warns = num_diagnostics[vim.diagnostic.severity.WARN]

      if num_errs ~= nil then
        diagnostics = diagnostics .. "[%#DiagnosticError#" .. num_errs .. "e%*]"
      end

      if num_warns ~= nil then
        diagnostics = diagnostics .. "[%#DiagnosticWarn#" .. num_warns .. "w%*]"
      end

      for _, v in ipairs(clients) do
        diagnostics = diagnostics .. "[" .. v.name .. "]"
      end
    end
  end

  return string.format("─%s[%s][%s][%s]%s%s─", state, vim.fn.mode(), filename, location, "%=", diagnostics);
end
