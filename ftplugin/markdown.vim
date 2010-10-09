" Vim filetype plugin
" Language:		Markdown
" Maintainer:		Tim Pope <vimNOSPAM@tpope.org>

if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim
unlet! b:did_ftplugin

function! MarkdownFoldLevel(lnum)
    let thisline = getline(a:lnum)

    if thisline =~ '^#\+#\@!'
	    return ">" . strlen(matchstr(thisline, '^#\+#\@!'))
    endif

    if a:lnum == 1
        return 0
    endif

    return "="
endfunction

setlocal foldmethod=expr
setlocal foldexpr=MarkdownFoldLevel(v:lnum)

setlocal comments=fb:*,fb:-,fb:+,n:> commentstring=>\ %s
setlocal formatoptions+=tcqln
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+

let b:undo_ftplugin .= "|setl cms< com< fo<"

" vim:set sw=2:
