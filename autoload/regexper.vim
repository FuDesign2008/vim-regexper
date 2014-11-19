let s:save_cpo = &cpo | set cpo&vim
"Variable {{{
let s:baseUrl          = 'http://www.regexper.com'
"let s:baseUrl         = 'http://www.regexper.com/parse'
let s:basePath         = expand('<sfile>:p:h:h')
let s:jsonFilePath     = s:basePath.'/html/js/regexper.json'
let s:htmlFilePath     = s:basePath.'/html/index.html'
let g:regexper#OpenCmd = ! exists('g:regexper#OpenCmd') ? 'open -a firefox' : g:regexper#OpenCmd
"vital
let s:V = vital#of('regexper')
let s:HTTP = s:V.import('Web.HTTP')
let s:JSON = s:V.import('Web.JSON')
"}}}
function! regexper#Execute(args) "{{{
    "Write file
    "TODO:herokuサーバへのリクエス卜へ変更
    "TODO:regexperのローカライズ
    "TODO:正規表現を引数化
    "TODO:Windows環境対応
    "call system(join(['echo "',
    "\    s:JSON.decode(s:HTTP.post(s:baseUrl, {
    "\        'regexp_input': '[a-zA-Z0-9-_.]@[a-zA-Z0-9_-]',}).content),
    "\    '" > ', s:jsonFilePath,],''))
    "Open browser
    "TODO:Windows環境対応
    if exists('g:regexper#OpenCmd') && !empty(g:regexper#OpenCmd)
        call system(g:regexper#OpenCmd.' '.s:baseUrl.'#'.a:args,)
        "call system(g:regexper#OpenCmd.' '.s:htmlFilePath,)
    else
        echohl ErrorMsg | echomsg "vim-regexper: require 'g:regexperOpenCmd'" | echohl None
        return
    endif
    return
endfunction
"}}}
let &cpo = s:save_cpo | unlet s:save_cpo

