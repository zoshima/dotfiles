vim.opt.statusline = "%!v:lua.Statusline.get_statusline()"

vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function()
    vim.opt.statusline = "%!v:lua.Statusline.get_statusline()"
  end
})

Statusline = {}

function Statusline.get_statusline()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local current_win = vim.api.nvim_get_current_win()

  local filename = "[%t]"
  if current_win == vim.g.statusline_winid then
    filename = "%#StatusLineFileName#" .. filename .. "%*"
  end

  local diagnostics = Statusline.get_diagnostics(bufnr)

  local left = "[%n]" .. "[%Y%M%R]" .. filename .. "[%l:%c]"
  local right = diagnostics

  return string.format("─%s%s%s─", left, "%=", right);
end

function Statusline.get_diagnostics(bufnr)
  local clients = vim.lsp.get_clients({
    bufnr = bufnr
  })

  if clients == nil or #clients == 0 then
    return ""
  end

  local num_diagnostics = vim.diagnostic.count(bufnr, {
    severity = {
      vim.diagnostic.severity.ERROR,
      vim.diagnostic.severity.WARN,
      vim.diagnostic.severity.INFO,
      vim.diagnostic.severity.HINT,
    }
  })

  local diagnostics = ""

  local num_err = num_diagnostics[vim.diagnostic.severity.ERROR]
  if num_err ~= nil then
    diagnostics = diagnostics .. "[%#DiagnosticError#" .. num_err .. "e%*]"
  end

  local num_warn = num_diagnostics[vim.diagnostic.severity.WARN]
  if num_warn ~= nil then
    diagnostics = diagnostics .. "[%#DiagnosticWarn#" .. num_warn .. "w%*]"
  end

  local num_info = num_diagnostics[vim.diagnostic.severity.INFO]
  if num_info ~= nil then
    diagnostics = diagnostics .. "[%#DiagnosticInfo#" .. num_info .. "i%*]"
  end

  local num_hint = num_diagnostics[vim.diagnostic.severity.HINT]
  if num_hint ~= nil then
    diagnostics = diagnostics .. "[%#DiagnosticHint#" .. num_hint .. "h%*]"
  end

  for _, v in ipairs(clients) do
    diagnostics = diagnostics .. "[" .. v.name .. "]"
  end

  return diagnostics
end
