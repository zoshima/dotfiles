-- commands
vim.cmd([[
  command! GitBlame lua GitBlame()
  command! -nargs=1 GitShow lua GitShow(<f-args>)
  command! ShowHighlightInfo lua ShowHighlightInfo()
  command! CopyFilePath lua CopyFilePath()
  command! ReloadColorScheme so ~/git/dotfiles/nvim/lua/colorscheme.lua
]])

-- global functions
function GitBlame()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_row, _ = unpack(vim.api.nvim_win_get_cursor(current_win))

  vim.cmd("vertical new")

  local new_win = vim.api.nvim_get_current_win()
  local new_buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_set_option_value("readonly", true, { buf = new_buf })
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = new_buf })
  vim.api.nvim_set_option_value("bufhidden", "delete", { buf = new_buf })

  local blame_output = vim.fn.systemlist("git blame " .. vim.api.nvim_buf_get_name(current_buf))
  vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, blame_output)

  vim.api.nvim_win_set_cursor(new_win, { current_row, 0 })
end

function GitShow(revision)
  local current_file_path = vim.fn.expand("%")
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_row, _ = unpack(vim.api.nvim_win_get_cursor(current_win))

  vim.cmd("vertical new")

  local new_win = vim.api.nvim_get_current_win()
  local new_buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_set_option_value("readonly", true, { buf = new_buf })
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = new_buf })
  vim.api.nvim_set_option_value("bufhidden", "delete", { buf = new_buf })

  local blame_output = vim.fn.systemlist("git show " .. revision .. ":" .. current_file_path)
  vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, blame_output)

  vim.api.nvim_win_set_cursor(new_win, { current_row, 0 })
end

function ShowHighlightInfo()
  local result = vim.treesitter.get_captures_at_cursor(0)
  print(vim.inspect(result))
end

function CopyFilePath()
  local file_path = vim.fn.expand('%:p')
  vim.fn.setreg('+', file_path)
end
