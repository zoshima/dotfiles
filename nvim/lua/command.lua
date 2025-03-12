local function scratch(command, filetype)
  local buffer = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, buffer)
  vim.api.nvim_set_option_value('filetype', filetype, {
    buf = buffer
  })

  vim.cmd(":read !" .. command)
end

vim.api.nvim_create_user_command("GitBlame", function()
  local file_path = vim.fn.expand('%:p')
  local buffer = vim.api.nvim_get_current_buf()
  local file_type = vim.api.nvim_get_option_value("filetype", {
    buf = buffer
  })

  scratch("git blame " .. file_path, file_type)
end, {})
