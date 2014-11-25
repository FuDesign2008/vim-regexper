let s:save_cpo = &cpo|set cpo&vim
"Variable {{{
let g:regexper#BaseUrl   = ! exists('g:regexper#BaseUrl') ? 'http://vim-regexper.herokuapp.com/' : g:regexper#BaseUrl
let s:regexperAppPathFlg = ! exists('s:regexperAppPathFlg') ? 0 : s:regexperAppPathFlg
let s:V                  = vital#of('regexper')
let s:HTTP               = s:V.import('Web.HTTP')
"}}}
"TODO:Windows environment
function! regexper#Execute(args) "{{{
    "Kick regexper
    if ! s:kick_application()
        return
    endif
    "Open browser
    if exists('g:regexper#OpenCmd')
        silent! call s:system(g:regexper#OpenCmd.' "'.g:regexper#BaseUrl.'#'.s:HTTP.encodeURI(a:args).'"')
    else
        call s:open_browser(g:regexper#BaseUrl.'#'.s:HTTP.encodeURI(a:args))
    endif
    return
endfunction
"}}}
function! s:kick_application() "{{{
    if exists('g:regexper#AppPath') && s:regexperAppPathFlg == 0
        let a:cwdPath = getcwd()
        execute 'lcd' fnameescape(g:regexper#AppPath)
        silent! call s:system('nohup foreman start > /dev/null 2>&1 &')
        execute 'lcd' fnameescape(a:cwdPath)
        let g:regexper#BaseUrl = (g:regexper#BaseUrl ==# 'http://vim-regexper.herokuapp.com/') ? 'http://0.0.0.0:5000' : g:regexper#BaseUrl
        sleep 3000ms "Maybe lazy suppot
        let s:regexperAppPathFlg = 1
    endif
    return 1
endfunction
"}}}
function! s:system(cmd) "{{{
    try
        return vimproc#system(a:cmd)
    catch /E117.*/
        return system(a:cmd)
    endtry
endfunction
"}}}
function! s:open_browser(path) "{{{
    try
        call OpenBrowser(a:path)
    catch /E117.*/
        echohl ErrorMsg | echomsg "vim-regexper: Check 'g:regexper#OpenCmd' or open_browser." | echohl None
    endtry
endfunction
"}}}
let &cpo = s:save_cpo|unlet s:save_cpo
