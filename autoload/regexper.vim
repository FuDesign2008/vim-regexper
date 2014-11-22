let s:save_cpo = &cpo | set cpo&vim
"Variable {{{
let s:baseUrl      = 'http://vim-regexper.herokuapp.com/'
"let s:baseUrl     = 'http://vim-regexper.herokuapp.com/parse/'
let s:basePath     = expand('<sfile>:p:h:h')
let s:jsonFilePath = s:basePath.'/html/js/regexper.json'
let s:htmlFilePath = s:basePath.'/html/index.html'
"vital
let s:V = vital#of('regexper')
let s:HTTP = s:V.import('Web.HTTP')
let s:JSON = s:V.import('Web.JSON')
"}}}
function! regexper#Execute(args) "{{{
    "Init
    if !exists('g:regexper#OpenCmd')
        echohl ErrorMsg | echomsg "vim-regexper: require 'g:regexperOpenCmd'" | echohl None
        return
    endif
    "Write file
    "TODO:herokuサーバへのリクエス卜へ変更
    "TODO:regexperのローカライズ
    "TODO:Windows環境対応
    "call system(join(['echo "',
    "\    s:JSON.decode(s:HTTP.post(s:baseUrl, {
    "\        'regexp_input': '[a-zA-Z0-9-_.]@[a-zA-Z0-9_-]',}).content),
    "\    '" > ', s:jsonFilePath,],''))
    "Open browser
    "TODO:Windows環境対応
    call system(g:regexper#OpenCmd.' '.s:baseUrl.'#'.a:args,)
    "call system(g:regexper#OpenCmd.' '.s:htmlFilePath,)
    return
endfunction
"}}}
let &cpo = s:save_cpo | unlet s:save_cpo

