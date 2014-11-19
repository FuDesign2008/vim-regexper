if &cp || (exists('g:loaded_regexper') && g:loaded_regexper)
    finish
endif
let g:loaded_regexper = 1

command! -nargs=1 RegexperExecute :call regexper#Execute(<q-args>)
