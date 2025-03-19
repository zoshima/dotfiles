vim.opt.statusline = "%!v:lua.Statusline()"

vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function()
    vim.cmd("redrawstatus")
  end
})

function Statusline()
  local winid = vim.api.nvim_get_current_win()
  local bufid = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local lsp_clients = vim.lsp.get_clients({ bufnr = bufid })
  local dc = vim.diagnostic.count(bufid)

  local filename = winid == vim.g.statusline_winid
      and "[%#StatusLineFileName#%f%*]"
      or "[%f]"
  local errors = dc[vim.diagnostic.severity.ERROR]
      and "[%#DiagnosticError#" .. dc[vim.diagnostic.severity.ERROR] .. "e%*]"
      or ""
  local warnings = dc[vim.diagnostic.severity.WARN]
      and "[%#DiagnosticWarn#" .. dc[vim.diagnostic.severity.WARN] .. "w%*]"
      or ""
  local info = dc[vim.diagnostic.severity.INFO]
      and "[%#DiagnosticInfo#" .. dc[vim.diagnostic.severity.INFO] .. "i%*]"
      or ""
  local hints = dc[vim.diagnostic.severity.HINT]
      and "[%#DiagnosticHint#" .. dc[vim.diagnostic.severity.HINT] .. "h%*]"
      or ""

  local clients = ""
  if #lsp_clients > 0 then
    for _, v in ipairs(lsp_clients) do
      clients = clients .. "[" .. v.name .. "]"
    end
  end

  return "%m%r" .. filename .. "[%l:%c]" .. "%="
      .. errors .. warnings .. info .. hints .. clients .. "%y"
end
