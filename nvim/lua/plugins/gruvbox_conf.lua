vim.cmd("colorscheme gruvbox")

vim.cmd([[
  " gray      #7c6f64
  " red       #fb4934
  " green     #b8bb26
  " yellow    #fabd2f
  
  hi SignColumn guibg=NONE
  hi StatusLine guibg=NONE
  hi CursorLineNr guibg=NONE
  hi StatusLine guibg=0 guifg=#7c6f64 gui=NONE
  hi StatusLineNC guibg=0 guifg=#7c6f64 gui=NONE
  hi VertSplit guifg=#7c6f64
  hi SignatureMarkText guibg=NONE guifg=#8ec081

  hi LspDiagnosticsDefaultError guibg=NONE guifg=#fb4934
  hi LspDiagnosticsSignError guibg=NONE guifg=#fb4934
  hi LspDiagnosticsDefaultWarning guibg=NONE guifg=#fabd2f
  hi LspDiagnosticsSignWarning guibg=NONE guifg=#fabd2f

  hi Pmenu guibg=#3c3836 guifg=#bdae93

  hi StatusLineFileName guibg=0 guifg=#fabd2f gui=NONE

  " hi NormalFloat guifg=#7c6f64 guibg=NONE
  " hi FloatBorder guifg=#7c6f64 guibg=NONE
]])
