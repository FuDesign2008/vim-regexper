let s:save_cpo = &cpo | set cpo&vim
"Variable {{{
let s:baseUrl  = 'http://www.regexper.com/parse'
let s:fileName = 'regexper.json'
let s:basePath = expand('<sfile>:p:h:h')
"vital
let s:V = vital#of('regexper')
let s:List  = s:V.import('Data.List')
let s:HTTP  = s:V.import('Web.HTTP')
let s:JSON  = s:V.import('Web.JSON')
"}}}
function! regexper#Execute() "{{{
    "Delete file(上書きのため、不要なはず)
    "call delete(a:jsonFile)
    "Write file
    call system(join(['echo "',
    \    s:JSON.decode(s:HTTP.post(s:baseUrl, {
    \        'regexp_input': '[a-zA-Z0-9-_.]@[a-zA-Z0-9_-]',}).content),
    \    '" > ', s:basePath, '/html/js/', s:fileName,],''))
    "Open browser
    return
endfunction
"}}}
let &cpo = s:save_cpo | unlet s:save_cpo

