" Lamplit Monastery: colors sampled from ~/Pictures/background.png
hi clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'lamplit'
set background=dark
if has('termguicolors') | set termguicolors | endif

" Palette
let s:abyss='#252626' | let s:matte='#282828' | let s:soot='#2f2e2d' | let s:cellar='#383534'
let s:flint='#3d3a37' | let s:basalt='#45403d' | let s:mountain='#504c47' | let s:haze='#60605b' | let s:moss='#757f76'
let s:sage='#9fa589' | let s:parch='#cbc49c' | let s:lamp='#dad0a5' | let s:rose='#9c837f'
let s:ember='#b07a6e' | let s:lichen='#a1a888' | let s:ochre='#c9b27a' | let s:slate='#7f9396' | let s:pilgrim='#a08a99' | let s:verd='#8fa89e'

function! s:h(group, fg, bg, ...) abort
  let l:attr = a:0 ? a:1 : 'NONE'
  exe 'hi' a:group 'guifg='.a:fg 'guibg='.a:bg 'gui='.l:attr 'cterm='.l:attr
endfunction

" Editor
call s:h('Normal', s:parch, s:matte)
call s:h('NormalFloat', s:parch, s:soot)
call s:h('Cursor', s:matte, s:lamp)
call s:h('CursorLine', 'NONE', s:soot)
call s:h('CursorColumn', 'NONE', s:soot)
call s:h('ColorColumn', 'NONE', s:soot)
call s:h('LineNr', s:mountain, 'NONE')
call s:h('CursorLineNr', s:sage, s:soot)
call s:h('SignColumn', s:mountain, 'NONE')
call s:h('FoldColumn', s:mountain, 'NONE')
call s:h('Folded', s:moss, s:soot)
call s:h('VertSplit', s:basalt, s:matte)
call s:h('WinSeparator', s:basalt, s:matte)
call s:h('EndOfBuffer', s:matte, 'NONE')
call s:h('NonText', s:basalt, 'NONE')
call s:h('SpecialKey', s:basalt, 'NONE')
call s:h('Whitespace', s:basalt, 'NONE')
call s:h('Conceal', s:haze, 'NONE')
call s:h('MatchParen', s:lamp, s:mountain, 'bold')
call s:h('Visual', 'NONE', s:cellar)
call s:h('Search', s:matte, s:ochre)
call s:h('IncSearch', s:matte, s:lamp)
call s:h('Substitute', s:matte, s:ember)
call s:h('Directory', s:slate, 'NONE')
call s:h('Title', s:lamp, 'NONE', 'bold')
call s:h('Question', s:lichen, 'NONE')
call s:h('MoreMsg', s:lichen, 'NONE')
call s:h('ModeMsg', s:sage, 'NONE')
call s:h('ErrorMsg', s:ember, 'NONE', 'bold')
call s:h('WarningMsg', s:ochre, 'NONE')

" Bars and menus
call s:h('StatusLine', s:parch, s:basalt)
call s:h('StatusLineNC', s:moss, s:soot)
call s:h('TabLine', s:moss, s:soot)
call s:h('TabLineFill', s:moss, s:abyss)
call s:h('TabLineSel', s:lamp, s:matte, 'bold')
call s:h('WildMenu', s:matte, s:sage)
call s:h('Pmenu', s:parch, s:soot)
call s:h('PmenuSel', s:lamp, s:basalt)
call s:h('PmenuSbar', 'NONE', s:flint)
call s:h('PmenuThumb', 'NONE', s:moss)

" Syntax
call s:h('Comment', s:haze, 'NONE', 'italic')
call s:h('Constant', s:rose, 'NONE')
call s:h('String', s:lichen, 'NONE')
call s:h('Character', s:lichen, 'NONE')
call s:h('Number', s:ochre, 'NONE')
call s:h('Boolean', s:ochre, 'NONE')
call s:h('Float', s:ochre, 'NONE')
call s:h('Identifier', s:parch, 'NONE')
call s:h('Function', s:slate, 'NONE')
call s:h('Statement', s:pilgrim, 'NONE')
call s:h('Conditional', s:pilgrim, 'NONE')
call s:h('Repeat', s:pilgrim, 'NONE')
call s:h('Label', s:pilgrim, 'NONE')
call s:h('Operator', s:moss, 'NONE')
call s:h('Keyword', s:pilgrim, 'NONE')
call s:h('Exception', s:ember, 'NONE')
call s:h('PreProc', s:sage, 'NONE')
call s:h('Include', s:sage, 'NONE')
call s:h('Define', s:sage, 'NONE')
call s:h('Macro', s:sage, 'NONE')
call s:h('Type', s:verd, 'NONE')
call s:h('StorageClass', s:verd, 'NONE')
call s:h('Structure', s:verd, 'NONE')
call s:h('Typedef', s:verd, 'NONE')
call s:h('Special', s:ochre, 'NONE')
call s:h('SpecialChar', s:ochre, 'NONE')
call s:h('Delimiter', s:moss, 'NONE')
call s:h('SpecialComment', s:moss, 'NONE', 'italic')
call s:h('Underlined', s:slate, 'NONE', 'underline')
call s:h('Ignore', s:haze, 'NONE')
call s:h('Error', s:ember, 'NONE', 'bold')
call s:h('Todo', s:ochre, 'NONE', 'bold')

" Diff
call s:h('DiffAdd', 'NONE', '#2f352c')
call s:h('DiffChange', 'NONE', '#2f3333')
call s:h('DiffDelete', s:ember, '#38302d')
call s:h('DiffText', s:lamp, '#3c4140', 'bold')
call s:h('diffAdded', s:lichen, 'NONE')
call s:h('diffRemoved', s:ember, 'NONE')
call s:h('diffChanged', s:slate, 'NONE')

" Spell
exe 'hi SpellBad   guisp='.s:ember.' gui=undercurl cterm=underline guifg=NONE guibg=NONE'
exe 'hi SpellCap   guisp='.s:ochre.' gui=undercurl cterm=underline guifg=NONE guibg=NONE'
exe 'hi SpellLocal guisp='.s:slate.' gui=undercurl cterm=underline guifg=NONE guibg=NONE'
exe 'hi SpellRare  guisp='.s:pilgrim.' gui=undercurl cterm=underline guifg=NONE guibg=NONE'

" Extra highlight groups: links to the base groups above, with a few overrides
function! s:l(from, to) abort
  exe 'hi! link' a:from a:to
endfunction

" Rust (rust.vim)
for [s:f, s:t] in [['rustModPath','Type'],['rustModPathSep','Delimiter'],['rustSigil','Operator'],
      \ ['rustSelf','Keyword'],['rustLifetime','Special'],['rustMacro','Macro'],['rustMacroVariable','Identifier'],
      \ ['rustAttribute','PreProc'],['rustDerive','PreProc'],['rustDeriveTrait','Type'],['rustTrait','Type'],
      \ ['rustEnumVariant','Constant'],['rustCommentLineDoc','Comment'],['rustCommentBlockDoc','Comment'],
      \ ['rustFuncCall','Function'],['rustFuncName','Function'],['rustStorage','StorageClass']]
  call s:l(s:f, s:t)
endfor

" Python
for [s:f, s:t] in [['pythonBuiltin','Type'],['pythonDecorator','PreProc'],['pythonDecoratorName','PreProc'],
      \ ['pythonOperator','Keyword'],['pythonExceptions','Exception'],['pythonFunction','Function']]
  call s:l(s:f, s:t)
endfor

" Shell
for [s:f, s:t] in [['shQuote','String'],['shVariable','Identifier'],['shDerefSimple','Identifier'],
      \ ['shDeref','Identifier'],['shSetList','Identifier'],['shCommandSub','Special'],['shOption','Constant'],
      \ ['shFunction','Function'],['shShebang','Comment'],['shTestOpr','Operator']]
  call s:l(s:f, s:t)
endfor

" Vim script
for [s:f, s:t] in [['vimCommand','Statement'],['vimHiGroup','Type'],['vimGroup','Type'],['vimOption','Constant'],
      \ ['vimNotation','Special'],['vimUserFunc','Function'],['vimFunction','Function'],['vimVar','Identifier'],
      \ ['vimIsCommand','Identifier'],['vimHiAttrib','Constant'],['vimHiGuiRgb','Number']]
  call s:l(s:f, s:t)
endfor

" Markdown
call s:h('markdownH1', s:lamp, 'NONE', 'bold')
call s:h('markdownH2', s:sage, 'NONE', 'bold')
call s:h('markdownH3', s:sage, 'NONE')
call s:h('markdownH4', s:verd, 'NONE')
call s:h('markdownH5', s:verd, 'NONE')
call s:h('markdownH6', s:verd, 'NONE')
call s:h('markdownBold', s:lamp, 'NONE', 'bold')
call s:h('markdownItalic', s:parch, 'NONE', 'italic')
call s:h('markdownBoldItalic', s:lamp, 'NONE', 'bold,italic')
call s:h('markdownCode', s:lichen, s:soot)
call s:h('markdownCodeBlock', s:lichen, 'NONE')
call s:h('markdownCodeDelimiter', s:haze, 'NONE')
call s:h('markdownBlockquote', s:moss, 'NONE', 'italic')
call s:h('markdownListMarker', s:ochre, 'NONE')
call s:h('markdownRule', s:basalt, 'NONE')
call s:h('markdownHeadingDelimiter', s:haze, 'NONE')
call s:h('markdownLinkText', s:slate, 'NONE', 'underline')
call s:h('markdownUrl', s:haze, 'NONE')
call s:h('markdownLinkDelimiter', s:haze, 'NONE')

" HTML / XML / CSS
for [s:f, s:t] in [['htmlTag','Delimiter'],['htmlEndTag','Delimiter'],['htmlTagName','Statement'],
      \ ['htmlSpecialTagName','Statement'],['htmlArg','Type'],['htmlSpecialChar','SpecialChar'],
      \ ['xmlTag','Delimiter'],['xmlEndTag','Delimiter'],['xmlTagName','Statement'],['xmlAttrib','Type'],
      \ ['cssTagName','Statement'],['cssClassName','Type'],['cssIdentifier','Type'],['cssProp','Identifier'],
      \ ['cssAttr','Number'],['cssColor','Number'],['cssBraces','Delimiter'],['cssPseudoClassId','Special']]
  call s:l(s:f, s:t)
endfor
call s:h('htmlH1', s:lamp, 'NONE', 'bold')
call s:h('htmlBold', s:lamp, 'NONE', 'bold')
call s:h('htmlItalic', s:parch, 'NONE', 'italic')
call s:h('htmlLink', s:slate, 'NONE', 'underline')

" JSON / YAML / TOML / ini
for [s:f, s:t] in [['jsonKeyword','Type'],['jsonQuote','Delimiter'],['jsonBraces','Delimiter'],['jsonNull','Boolean'],
      \ ['yamlKey','Type'],['yamlBlockMappingKey','Type'],['yamlFlowMappingKey','Type'],['yamlAnchor','PreProc'],
      \ ['yamlAlias','PreProc'],['tomlTable','Statement'],['tomlKey','Type'],['tomlTableArray','Statement'],
      \ ['dosiniHeader','Statement'],['dosiniLabel','Type'],['confComment','Comment']]
  call s:l(s:f, s:t)
endfor

" Git commits and diffs
for [s:f, s:t] in [['gitcommitSummary','Title'],['gitcommitComment','Comment'],['gitcommitBranch','Type'],
      \ ['gitcommitHeader','Comment'],['gitcommitSelectedFile','diffAdded'],['gitcommitDiscardedFile','diffRemoved'],
      \ ['gitcommitUntrackedFile','Constant'],['gitcommitOverflow','Error'],
      \ ['diffFile','Title'],['diffNewFile','Title'],['diffIndexLine','Comment'],['diffLine','Special'],
      \ ['diffSubname','Special']]
  call s:l(s:f, s:t)
endfor

" UltiSnips snippet files
for [s:f, s:t] in [['snipSnippet','Statement'],['snipSnippetHeader','Statement'],['snipSnippetFooter','Statement'],
      \ ['snipLeadingSpaces','NonText'],['snipTabStop','Special'],['snipTabStopDefault','String'],
      \ ['snipVisual','Special'],['snipVimLExpression','Identifier'],['snipShellCode','Identifier'],
      \ ['snipPythonCode','Identifier'],['snipTransformation','Special'],['snipComment','Comment']]
  call s:l(s:f, s:t)
endfor

" Diagnostics / LSP-style groups (harmless if unused)
call s:h('DiagnosticError', s:ember, 'NONE')
call s:h('DiagnosticWarn', s:ochre, 'NONE')
call s:h('DiagnosticInfo', s:slate, 'NONE')
call s:h('DiagnosticHint', s:verd, 'NONE')
exe 'hi DiagnosticUnderlineError guisp='.s:ember.' gui=undercurl guifg=NONE guibg=NONE cterm=underline'
exe 'hi DiagnosticUnderlineWarn  guisp='.s:ochre.' gui=undercurl guifg=NONE guibg=NONE cterm=underline'

" Terminal ANSI palette for :terminal
let g:terminal_ansi_colors = [s:abyss, s:ember, s:lichen, s:ochre, s:slate, s:pilgrim, s:verd, s:parch,
      \ s:mountain, s:ember, s:sage, s:lamp, s:slate, s:pilgrim, s:verd, s:lamp]
