vim.opt.statusline = "%!v:lua.Statusline.get_statusline()"

Statusline = {}

function Statusline.get_statusline()
  local filename = "[%#StatusLineFileName#%t%*]"
  local location = "[%l:%c]"
  local state = "%r%m"
  local mode = string.format("[%s]", vim.fn.mode())
  local diagnostics = Statusline.get_diagnostics()

  local left = string.format("%s%s%s%s", state, mode, filename, location)
  local center = ""
  local right = string.format("%s", diagnostics)

  return string.format("─%s%s%s%s%s─", left, "%=", center, "%=", right);
end

function Statusline.get_diagnostics()
  local diagnostics = ""

  local clients = vim.lsp.get_clients({
    bufnr = 0
  })

  if #clients > 0 then
    local num_diagnostics = vim.diagnostic.count(0, {
      severity = {
        vim.diagnostic.severity.ERROR,
        vim.diagnostic.severity.WARN,
        vim.diagnostic.severity.INFO,
        vim.diagnostic.severity.HINT,
      }
    })

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
  end

  return diagnostics
end
