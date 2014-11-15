let s:save_cpo = &cpo | set cpo&vim
"Variable {{{
let s:base_url='http://www.regexper.com/parse'
"Vital.Web.HTTP
let s:V           = vital#of('regexper')
let s:HTTP        = s:V.import('Web.HTTP')
let regexper#http = s:HTTP
"}}}
function! regexper#http() " {{{
    return s:HTTP
endfunction
"}}}
function! regexper#Execute() "{{{
    let a:response = s:HTTP.post(s:base_url, {
    \    'regexp_input': '[a-zA-Z0-9-_.]@[a-zA-Z0-9_-]',})
    echo a:response
endfunction
"}}}
let &cpo = s:save_cpo | unlet s:save_cpo

