hi clear

let g:colors_name = 'default'

" :h group-name
hi Comment ctermfg=Gray ctermbg=NONE cterm=NONE
hi Constant ctermfg=Green ctermbg=NONE cterm=NONE
hi Identifier ctermfg=White ctermbg=NONE cterm=NONE
hi Function ctermfg=Yellow ctermbg=NONE cterm=NONE
hi Statement ctermfg=Red ctermbg=NONE cterm=NONE
hi PreProc ctermfg=Cyan ctermbg=NONE cterm=NONE
hi Type ctermfg=Blue ctermbg=NONE cterm=NONE
hi Special ctermfg=Magenta ctermbg=NONE cterm=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline
hi Added ctermfg=Green ctermbg=NONE cterm=NONE
hi Changed ctermfg=Yellow ctermbg=NONE cterm=NONE
hi Removed ctermfg=Red ctermbg=NONE cterm=NONE
hi Ignore ctermfg=Gray ctermbg=NONE cterm=NONE
hi Error ctermfg=Red ctermbg=NONE cterm=NONE
hi Todo ctermfg=Magenta ctermbg=NONE cterm=NONE

" :h highlight-groups
hi Normal ctermfg=White ctermbg=NONE cterm=NONE
hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi Directory ctermfg=Blue ctermbg=NONE cterm=bold 
hi LineNr ctermfg=DarkGray ctermbg=NONE cterm=NONE 
hi CursorLineNr ctermfg=White ctermbg=NONE cterm=NONE 
hi MatchParen ctermfg=NONE ctermbg=NONE cterm=underline 
hi Pmenu ctermfg=NONE ctermbg=Black cterm=NONE 
hi PmenuSel ctermfg=NONE ctermbg=NONE cterm=reverse 
hi PmenuMatch ctermfg=Cyan ctermbg=NONE cterm=NONE 
hi QuickFixLine ctermfg=Cyan ctermbg=NONE cterm=NONE 
hi VertSplit ctermfg=DarkGray ctermbg=NONE cterm=NONE 
hi Search ctermfg=NONE ctermbg=NONE cterm=reverse 
hi CurSearch ctermfg=Black ctermbg=Cyan cterm=NONE 
hi! link IncSearch CurSearch
hi StatusLine ctermfg=White ctermbg=Black cterm=NONE 
hi StatusLineNC ctermfg=DarkGray ctermbg=Black cterm=NONE 
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link TabLine StatusLine
hi! link TabLineFill StatusLineNC
hi Title ctermfg=White ctermbg=NONE cterm=NONE
hi NonText ctermfg=DarkGray ctermbg=NONE cterm=NONE
hi Visual ctermfg=NONE ctermbg=NONE cterm=reverse
hi! link ErrorMsg Error
hi SpellBad ctermfg=NONE ctermbg=NONE cterm=undercurl ctermul=Red
hi SpellCap ctermfg=NONE ctermbg=NONE cterm=undercurl ctermul=Blue
hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=undercurl ctermul=Green
hi SpellRare ctermfg=NONE ctermbg=NONE cterm=undercurl ctermul=Magenta
hi DiffAdd ctermfg=Green ctermbg=NONE cterm=NONE
hi DiffChange ctermfg=Yellow ctermbg=NONE cterm=NONE
hi DiffDelete ctermfg=Red ctermbg=NONE cterm=NONE
hi DiffText ctermfg=Black ctermbg=Yellow cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=Black cterm=NONE

" /usr/share/vim/vim91/syntax/go.vim
let g:go_highlight_functions=1
let g:go_highlight_function_parameters=1
let g:go_highlight_function_calls=1
let g:go_highlight_types=1

hi! link goFunctionCall Function
hi! link goBuiltins Function

" /usr/share/vim/vim91/syntax/shared/typescriptcommon.vim
hi! link typescriptBraces Normal
hi! link typescriptUnion Normal
hi! link typescriptFuncCallArg Normal
hi! link typescriptCall Normal
hi! link typescriptObjectLabel Normal
hi! link typescriptDOMFormProp Normal
hi! link typescriptPaymentShippingOptionProp Normal
hi! link typescriptFileReaderProp Normal
hi! link typescriptResponseProp Normal
hi! link typescriptArrowFunc Normal
hi! link typescriptGlobal Normal
hi! link typescriptArrowFuncArg Normal
hi! link typescriptIdentifier Normal
hi! link typescriptCastKeyword Keyword
hi! link typescriptDecorator PreProc
hi! link typescriptGlobalMethod Function
hi! link typescriptArrayMethod Function
hi! link typescriptHeadersMethod Function
hi! link typescriptDOMDocMethod Function
hi! link typescriptBOMLocationMethod Function
hi! link typescriptBOMWindowMethod Function
hi! link typescriptConsoleMethod Function
hi! link typescriptStringMethod Function
hi! link typescriptTemplateSB Special
hi! link typescriptClassName Type
hi! link typescriptTypeReference Type
