if exists('b:did_indent')
  finish
endif

let b:did_indent = 1

setlocal nolisp
setlocal autoindent

setlocal indentexpr=GetKnitIndent(v:lnum)

if exists("*GetKnitIndent")
  finish
endif

let s:keepcpo = &cpo
set cpo&vim

func GetKnitIndent(lnum)
  let plnum = prevnonblank(a:lnum - 1)
  if plnum == 0 | return 0 | endif
  let ind = indent(plnum)
  if getline(a:lnum) =~ '^\s*}$'
    return ind - shiftwidth()
  endif
  if getline(plnum) =~ '^.*{$'
    return ind + shiftwidth()
  endif
  return ind
endfunc

let &cpo = s:keepcpo
unlet s:keepcpo
