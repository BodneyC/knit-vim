if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "knit"

let s:cpo_save = &cpo
set cpo&vim

set iskeyword+=-

syn match   KnitParens   "[(,)]"
syn match   KnitOperator "[(,]-" contains=KnitParens
syn match   KnitOperator "[*\"']"
syn match   KnitBraces   "[{}]"
syn match   KnitAssign   "="
syn match   KnitAlias    ":="
syn match   KnitComment  ";.*$" contains=KnitTodo,@Spell
syn keyword KnitType     cm mm inches
syn keyword KnitParens   ( )
syn keyword KnitTodo     FIXME NOTE NOTES TODO XXX contained
syn keyword KnitTodo     fixme note notes todo contained

syn keyword KnitCommonKeywords knit purl marker
syn match   KnitCommonKeywords "cast-on"
syn match   KnitCommonKeywords "needle-selection"
syn match   KnitCommonKeywords "cast-off"

hi def link KnitOperator Operator
hi def link KnitBraces   Operator
hi def link KnitType     Type
hi def link KnitComment  Comment
hi def link KnitTodo     Todo
hi def link KnitAssign   Directory
hi def link KnitAlias    Statement
hi def link KnitParens   Boolean

hi def link KnitCommonKeywords Keyword

let &cpo = s:cpo_save
unlet s:cpo_save
