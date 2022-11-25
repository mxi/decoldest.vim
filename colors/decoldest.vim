" Name:       decoldest
" Version:    2022.11.24
" Maintainer: https://github.com/mxi
" License:    MIT
"
" De absolute coldest vim colorscheme you will ever use.
"

" Initialization {{{
if 580 < version
  hi clear
  if exists('syntax on')
    syntax reset
  endif
endif

let g:colors_name="decoldest"

function s:hi(group, fg, bg, attr)
  execute "hi " .. a:group .. 
  \ (!empty(a:fg) ? " guifg=" .. a:fg.gui .. " ctermfg=" .. a:fg.cterm : "") ..
  \ (!empty(a:bg) ? " guibg=" .. a:bg.gui .. " ctermbg=" .. a:bg.cterm : "") ..
  \ (a:attr != "" ? "   gui=" ..   a:attr .. "   cterm=" .. a:attr     : "")
endfunction
" }}} Initialization

" Colors {{{
if &background ==? "dark"
  let s:base0     = {"gui": "#101010", "cterm": " 233"}
  let s:base1     = {"gui": "#404040", "cterm": " 238"}
  let s:base2     = {"gui": "#707070", "cterm": " 242"}
  let s:base3     = {"gui": "#a0a0a0", "cterm": " 247"}
  let s:base4     = {"gui": "#c0c0c0", "cterm": "   7"}
  let s:accent0   = {"gui": "#00dd42", "cterm": "  41"} " green
  let s:accent1   = {"gui": "#d6dd00", "cterm": " 184"} " yellow
  let s:accent2   = {"gui": "#dd2800", "cterm": " 158"} " red

  " specific color tweaks to be added below
  let s:comment   = {"gui": "#888888", "cterm": " 145"} " between base2/base3
  let s:diffadd   = s:accent0
  let s:diffchg   = s:accent1
  let s:diffdel   = s:accent2
else
  let s:base0     = {"gui": "#e8e8e8", "cterm": " 254"}
  let s:base1     = {"gui": "#d0d0d0", "cterm": " 145"}
  let s:base2     = {"gui": "#a0a0a0", "cterm": " 242"}
  let s:base3     = {"gui": "#808080", "cterm": " 238"}
  let s:base4     = {"gui": "#585858", "cterm": " 233"}
  let s:accent0   = {"gui": "#00af34", "cterm": "  35"} " green
  let s:accent1   = {"gui": "#afb500", "cterm": " 142"} " yellow
  let s:accent2   = {"gui": "#a51f01", "cterm": " 124"} " red

  " specific color tweaks to be added below
  let s:comment   = {"gui": "#878787", "cterm": " 145"} " between base2/base3
  let s:diffadd   = s:accent0
  let s:diffchg   = s:accent1
  let s:diffdel   = s:accent2
endif
let s:none              = {"gui": "NONE"   , "cterm": "NONE"}
" }}} Colors

" Editor {{{
let s:background = &background
call s:hi("Normal"      , s:base4    , s:base0     , "none"        )
call s:hi("NormNoBG"    , s:base4    , s:none      , "none"        )
call s:hi("NormNoBGBold", s:base4    , s:none      , "bold"        )
call s:hi("ColorColumn" , s:none     , s:base1     , "none"        )
call s:hi("TabLine"     , s:base2    , s:none      , "underline"   )
call s:hi("TabLineSel"  , s:base4    , s:none      , "underline"   )
call s:hi("TabLineFill" , s:base2    , s:none      , "underline"   )
call s:hi("Cursor"      , s:none     , s:none      , "reverse"     )
call s:hi("CursorColumn", s:none     , s:none      , "reverse"     )
call s:hi("CursorLine"  , s:none     , s:base1     , "none"        )
call s:hi("CursorLineNr", s:base4    , s:base1     , "none"        )
call s:hi("FoldColumn"  , s:none     , s:base2     , "none"        )
call s:hi("Folded"      , s:none     , s:base0     , "none"        )
call s:hi("IncSearch"   , s:none     , s:base0     , "reverse"     )
call s:hi("LineNr"      , s:base2    , s:base0     , "none"        )
call s:hi("MatchParen"  , s:base4    , s:base2     , "none"        )
call s:hi("Pmenu"       , s:none     , s:base1     , "none"        )
call s:hi("PmenuSel"    , s:none     , s:base2     , "none"        )
call s:hi("Search"      , s:none     , s:base0     , "reverse"     )
call s:hi("SignColumn"  , s:none     , s:base0     , "none"        )
call s:hi("StatusLine"  , s:base4    , s:base0     , "reverse"     )
call s:hi("StatusLineNC", s:base4    , s:base0     , "none"        )
call s:hi("VertSplit"   , s:base0    , s:base0     , "none"        )
call s:hi("Visual"      , s:none     , s:base1     , "none"        )
let &background = s:background
" }}} Editor

" General {{{
call s:hi("DiffAdd"     , s:diffadd  , s:none      , "none"        )
call s:hi("DiffChange"  , s:diffchg  , s:none      , "none"        )
call s:hi("DiffText"    , s:diffchg  , s:base0     , "reverse"     )
call s:hi("DiffDelete"  , s:diffdel  , s:none      , "none"        )
call s:hi("Comment"     , s:comment  , s:none      , "none"        )
call s:hi("Todo"        , s:none     , s:none      , "inverse,bold")
call s:hi("ErrorMsg"    , s:accent2  , s:base0     , "reverse"     )
call s:hi("WarningMsg"  , s:accent1  , s:base0     , "reverse"     )
call s:hi("SpecialKey"  , s:base2    , s:none      , "none"        )
call s:hi("NonText"     , s:base2    , s:none      , "none"        )
call s:hi("SpellBad"    , s:accent2  , s:none      , "undercurl"   )
call s:hi("SpellCap"    , s:none     , s:none      , "undercurl"   )
call s:hi("WildMenu"    , s:accent1  , s:base0     , "reverse"     )
call s:hi("Underlined"  , s:base4    , s:none      , "underline"   )

hi! link Title NormNoBGBold
hi! link MoreMsg NormNoBGBold
hi! link Question NormNoBGBold
hi! link Directory NormNoBGBold

hi! link Number NormNoBG
hi! link String NormNoBG
hi! link Special NormNoBG
hi! link Constant NormNoBG
hi! link Identifier NormNoBG
hi! link Character String

hi! link Keyword NormNoBGBold
hi! link Type Keyword
hi! link PreProc Keyword
hi! link Statement Keyword
hi! link Conditional Keyword
" }}} General

" vim: sw=2 ts=2 sts=2 et fdm=marker
