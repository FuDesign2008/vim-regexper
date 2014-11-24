let s:save_cpo = &cpo|set cpo&vim
"Variable {{{
let s:baseUrl = 'http://vim-regexper.herokuapp.com'
let s:V = vital#of('regexper')
let s:HTTP = s:V.import('Web.HTTP')
"}}}
"TODO:Windows environment
"TODO:localize
function! regexper#Execute(args) "{{{
    "Open browser
    if exists('g:regexper#OpenCmd')
        silent! call s:system(g:regexper#OpenCmd.' '.s:baseUrl.'#'.s:HTTP.encodeURI(a:args))
    else
        silent! call s:open_browser(s:baseUrl.'#'.s:HTTP.encodeURI(a:args))
    endif
    return
endfunction
"}}}
function! s:system(cmd) "{{{
    try
        let result = vimproc#system(a:cmd)
        return result
    catch /E117.*/
        return system(a:cmd)
    endtry
endfunction
"}}}
function! s:open_browser(path) "{{{
    try
        call OpenBrowser(a:path)
    catch /E117.*/
        echohl ErrorMsg | echomsg "vim-regexper: Check 'g:regexperOpenCmd' or open_browser." | echohl None
    endtry
endfunction
"}}}
let &cpo = s:save_cpo|unlet s:save_cpo
