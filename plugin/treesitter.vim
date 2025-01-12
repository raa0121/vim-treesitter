" Copied from https://github.com/nvim-treesitter/nvim-treesitter/blob/2b785889a4d0613465f72eccabd42468b345658d/plugin/nvim-treesitter.vim

if !has('patch-8.1.1')
  finish
endif

augroup treesitter
  au!
  autocmd FileType * call treesittervim#fire(1)
  autocmd TextChanged * call treesittervim#fire(1)
  autocmd TextChangedI * call treesittervim#fire(1)
  autocmd SafeState * call treesittervim#fire(0)
  if exists('##TextChangedP')
    autocmd TextChangedP * call treesittervim#fire(1)
  endif
augroup END

if exists('g:loaded_vim_treesitter')
  finish
endif

let g:loaded_vim_treesitter = 1

function s:has_attr(attr, mode)
  let norm_color = synIDattr(hlID('Normal'), a:attr, a:mode)
  return strlen(norm_color) > 0
endfunction

" if the ctermfg or guifg is not known by nvim then using the
" fg or foreground highlighting value will cause an E419 error
" so we check to see if either highlight has been set if not default to NONE
let cterm_normal = s:has_attr('fg', 'cterm') ? 'fg' : 'NONE'
let gui_normal = s:has_attr('fg', 'gui') ? 'foreground' : 'NONE'

execute 'highlight default TSNone term=NONE cterm=NONE gui=NONE guifg='.gui_normal.' ctermfg='.cterm_normal

highlight default link TSPunctDelimiter Delimiter
highlight default link TSPunctBracket Delimiter
highlight default link TSPunctSpecial Delimiter

highlight default link TSConstant Constant
highlight default link TSConstBuiltin Special
highlight default link TSConstMacro Define
highlight default link TSString String
highlight default link TSStringRegex String
highlight default link TSStringEscape SpecialChar
highlight default link TSStringSpecial SpecialChar
highlight default link TSCharacter Character
highlight default link TSNumber Number
highlight default link TSBoolean Boolean
highlight default link TSFloat Float

highlight default link TSFunction Function
highlight default link TSFuncBuiltin Special
highlight default link TSFuncMacro Macro
highlight default link TSParameter Identifier
highlight default link TSParameterReference TSParameter
highlight default link TSMethod Function
highlight default link TSField Identifier
highlight default link TSProperty Identifier
highlight default link TSConstructor Special
highlight default link TSAnnotation PreProc
highlight default link TSAttribute PreProc
highlight default link TSNamespace Include
highlight default link TSSymbol Identifier

highlight default link TSConditional Conditional
highlight default link TSRepeat Repeat
highlight default link TSLabel Label
highlight default link TSOperator Operator
highlight default link TSKeyword Keyword
highlight default link TSKeywordFunction Keyword
highlight default link TSKeywordOperator TSOperator
highlight default link TSKeywordReturn TSKeyword
highlight default link TSException Exception

highlight default link TSType Type
highlight default link TSTypeBuiltin Type
highlight default link TSInclude Include

highlight default link TSVariableBuiltin Special

highlight default link TSText TSNone
highlight default TSStrong term=bold cterm=bold gui=bold
highlight default TSEmphasis term=italic cterm=italic gui=italic
highlight default TSUnderline term=underline cterm=underline gui=underline
highlight default TSStrike term=strikethrough cterm=strikethrough gui=strikethrough
highlight default link TSMath Special
highlight default link TSTextReference Constant
highlight default link TSEnvironment Macro
highlight default link TSEnvironmentName Type
highlight default link TSTitle Title
highlight default link TSLiteral String
highlight default link TSURI Underlined

highlight default link TSComment Comment
highlight default link TSNote SpecialComment
highlight default link TSWarning Todo
highlight default link TSDanger WarningMsg

highlight default link TSTag Label
highlight default link TSTagDelimiter Delimiter
highlight default link TSTagAttribute TSProperty
