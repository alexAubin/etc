

let cBackg = "234"
let cForeg = "250"
let cBlack = "00"
let cDkYel = "11"
let cLtYel = "185"
let cGrray = "243"
let cDkRed = "01"
let cLtRed = "167"
let cDkBlu = "04"
let cLtBlu = "31"
let cDkCya = "06"
let cLtGre = "70"
let cLtCya = "14"

execute "hi Bold                                                            cterm=bold"
execute "hi Debug                    ctermfg=".cDkRed
execute "hi Directory                ctermfg=".cDkBlu
execute "hi ErrorMsg                 ctermfg=".cDkRed." ctermbg=".cBackg
execute "hi Exception                ctermfg=".cDkRed
execute "hi FoldColumn               ctermfg=".cBlack
execute "hi Folded                   ctermfg=".cGrray." ctermbg=".cBlack
execute "hi IncSearch                ctermfg=".cBlack." ctermbg=".cLtRed."  cterm=none"
execute "hi Italic                                                          cterm=none"
execute "hi Macro                    ctermfg=".cDkRed
execute "hi MatchParen               ctermfg=".cBackg." ctermbg=".cGrray
execute "hi ModeMsg                  ctermfg=".cLtYel
execute "hi MoreMsg                  ctermfg=".cLtYel
execute "hi Question                 ctermfg=".cDkBlu
execute "hi Search                   ctermfg=".cGrray." ctermbg=".cLtBlu
execute "hi SpecialKey               ctermfg=".cGrray
execute "hi TooLong                  ctermfg=".cDkRed
execute "hi Underlined               ctermfg=".cDkRed
execute "hi Visual                   ctermfg=".cDkYel
execute "hi VisualNOS                ctermfg=".cDkRed
execute "hi WarningMsg               ctermfg=".cDkRed
execute "hi WildMenu                 ctermfg=".cDkRed
execute "hi Title                    ctermfg=".cDkBlu."                     cterm=none"
execute "hi Conceal                  ctermfg=".cDkBlu." ctermbg=".cBackg
execute "hi Cursor                   ctermfg=".cBackg." ctermbg=".cForeg
execute "hi NonText                  ctermfg=".cGrray
execute "hi Normal                   ctermfg=".cForeg." ctermbg=".cBackg
execute "hi LineNr                   ctermfg=".cGrray." ctermbg=".cBackg
execute "hi SignColumn               ctermfg=".cGrray." ctermbg=".cBlack
execute "hi SpecialKey               ctermfg=".cGrray
execute "hi StatusLine               ctermfg=".cDkBlu." ctermbg=".cDkYel."  cterm=none"
execute "hi StatusLineNC             ctermfg=".cGrray." ctermbg=".cBlack."  cterm=none"
execute "hi VertSplit                ctermfg=".cDkYel." ctermbg=".cDkYel."  cterm=none"
execute "hi ColorColumn                                 ctermbg=".cDkRed."  cterm=none"
execute "hi CursorColumn             ctermfg=".cBlack."                     cterm=none"
execute "hi CursorLine               ctermfg=".cBlack."                     cterm=none"
execute "hi CursorLineNr             ctermfg=".cGrray." ctermbg=".cBlack
execute "hi PMenu                    ctermfg=".cDkBlu." ctermbg=".cBlack."  cterm=none"
execute "hi PMenuSel                 ctermfg=".cBlack." ctermbg=".cDkBlu
execute "hi TabLine                  ctermfg=".cGrray." ctermbg=".cBlack."  cterm=none"
execute "hi TabLineFill              ctermfg=".cGrray." ctermbg=".cBlack."  cterm=none"
execute "hi TabLineSel               ctermfg=".cLtYel." ctermbg=".cBlack."  cterm=none"

" Standard syntax highlighting
execute "hi Boolean                  ctermfg=".cLtRed."                     cterm=bold"
execute "hi Character                ctermfg=".cDkRed
execute "hi Comment                  ctermfg=".cGrray
execute "hi Conditional              ctermfg=".cLtGre."                     cterm=bold"
execute "hi Constant                 ctermfg=".cLtRed
execute "hi Define                   ctermfg=".cLtGre."                     cterm=bold"
execute "hi Delimiter                ctermfg=".cLtCya
execute "hi Float                    ctermfg=".cLtRed
execute "hi Function                 ctermfg=".cDkBlu
execute "hi Identifier               ctermfg=".cLtGre."                     cterm=none"
execute "hi Include                  ctermfg=".cDkBlu."                     cterm=bold"
execute "hi Keyword                  ctermfg=".cLtGre
execute "hi Label                    ctermfg=".cLtBlu
execute "hi Number                   ctermfg=".cLtRed
execute "hi Operator                 ctermfg=".cForeg."                     cterm=none"
execute "hi PreProc                  ctermfg=".cLtBlu."                     cterm=bold"
execute "hi Repeat                   ctermfg=".cLtGre."                     cterm=bold"
execute "hi Special                  ctermfg=".cDkCya
execute "hi SpecialChar              ctermfg=".cLtCya
execute "hi Statement                ctermfg=".cDkRed."                     cterm=bold"
execute "hi StorageClass             ctermfg=".cLtBlu
execute "hi String                   ctermfg=".cLtYel
execute "hi Structure                ctermfg=".cLtGre
execute "hi Tag                      ctermfg=".cDkBlu
execute "hi Todo                     ctermfg=".cLtBlu." ctermbg=".cBlack
execute "hi Type                     ctermfg=".cLtBlu."                     cterm=bold"
execute "hi Typedef                  ctermfg=".cLtBlu
                                    
" C highlighting                    
execute "hi cOperator                ctermfg=".cDkCya
execute "hi cPreCondit               ctermfg=".cLtGre
         
execute "hi cCustomFunc              ctermfg=".cForeg."                     cterm=bold"
execute "hi cCustomClass             ctermfg=".cForeg."                     cterm=bold"

" CSS highlighting                  
execute "hi cssBraces                ctermfg=".cForeg
execute "hi cssClassName             ctermfg=".cLtGre
execute "hi cssColor                 ctermfg=".cDkCya
                                    
" Diff highlighting                 
execute "hi DiffAdd                  ctermfg=".cLtYel." ctermbg=".cBlack
execute "hi DiffChange               ctermfg=".cGrray." ctermbg=".cBlack
execute "hi DiffDelete               ctermfg=".cDkRed." ctermbg=".cBlack
execute "hi DiffText                 ctermfg=".cDkBlu." ctermbg=".cBlack
execute "hi DiffAdded                ctermfg=".cLtYel." ctermbg=".cBackg
execute "hi DiffFile                 ctermfg=".cDkRed." ctermbg=".cBackg
execute "hi DiffNewFile              ctermfg=".cLtYel." ctermbg=".cBackg
execute "hi DiffLine                 ctermfg=".cDkBlu." ctermbg=".cBackg
execute "hi DiffRemoved              ctermfg=".cDkRed." ctermbg=".cBackg

" Git highlighting
execute "hi gitCommitOverflow        ctermfg=".cDkRed
execute "hi gitCommitSummary         ctermfg=".cLtYel
  
" GitGutter highlighting
execute "hi GitGutterAdd             ctermfg=".cLtYel." ctermbg=".cBlack
execute "hi GitGutterChange          ctermfg=".cDkBlu." ctermbg=".cBlack
execute "hi GitGutterDelete          ctermfg=".cDkRed." ctermbg=".cBlack
execute "hi GitGutterChangeDelete    ctermfg=".cLtGre." ctermbg=".cBlack

" HTML highlighting
execute "hi htmlBold                 ctermfg=".cLtBlu
execute "hi htmlItalic               ctermfg=".cLtGre
execute "hi htmlEndTag               ctermfg=".cForeg
execute "hi htmlTag                  ctermfg=".cForeg

" JavaScript highlighting
execute "hi javaScript               ctermfg=".cForeg
execute "hi javaScriptBraces         ctermfg=".cForeg
execute "hi javaScriptNumber         ctermfg=".cLtRed

" Markdown highlighting
execute "hi markdownCode             ctermfg=".cLtYel
execute "hi markdownError            ctermfg=".cForeg." ctermbg=".cBackg
execute "hi markdownCodeBlock        ctermfg=".cLtYel
execute "hi markdownHeadingDelimiter ctermfg=".cDkBlu

" NERDTree highlighting
execute "hi NERDTreeDirSlash         ctermfg=".cDkBlu
execute "hi NERDTreeExecFile         ctermfg=".cForeg
                                     
" PHP highlighting                   
execute "hi phpMemberSelector        ctermfg=".cForeg
execute "hi phpComparison            ctermfg=".cForeg
execute "hi phpParent                ctermfg=".cForeg

" Python highlighting
execute "hi pythonOperator           ctermfg=".cLtGre
execute "hi pythonRepeat             ctermfg=".cLtGre

" Ruby highlighting
execute "hi rubyAttribute              ctermfg=".cDkBlu
execute "hi rubyConstant               ctermfg=".cLtBlu
execute "hi rubyInterpolation          ctermfg=".cLtYel
execute "hi rubyInterpolationDelimiter ctermfg=".cLtCya
execute "hi rubyRegexp                 ctermfg=".cDkCya
execute "hi rubySymbol                 ctermfg=".cLtYel
execute "hi rubyStringDelimiter        ctermfg=".cLtYel

" SASS highlighting
execute "hi sassidChar               ctermfg=".cDkRed
execute "hi sassClassChar            ctermfg=".cLtRed
execute "hi sassInclude              ctermfg=".cLtGre
execute "hi sassMixing               ctermfg=".cLtGre
execute "hi sassMixinName            ctermfg=".cDkBlu

" Signify highlighting
execute "hi SignifySignAdd           ctermfg=".cLtYel." ctermbg=".cBlack
execute "hi SignifySignChange        ctermfg=".cDkBlu." ctermbg=".cBlack
execute "hi SignifySignDelete        ctermfg=".cDkRed." ctermbg=".cBlack

" Spelling highlighting
execute "hi SpellBad                 ctermbg=".cBackg." cterm=undercurl"
execute "hi SpellLocal               ctermbg=".cBackg." cterm=undercurl"
execute "hi SpellCap                 ctermbg=".cBackg." cterm=undercurl"
execute "hi SpellRare                ctermbg=".cBackg." cterm=undercurl"

" LaTeX
execute "hi texCmdName               ctermfg=".cLtGre."                     cterm=bold"
execute "hi texStatement             ctermfg=".cLtGre

