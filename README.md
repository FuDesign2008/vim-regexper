#vim-qfsigns
This Vim plugin is inspired at [regexper](http://regexper.com/).

##Installation
Sample setting is using [NeoBundle](https://github.com/Shougo/neobundle.vim).  
Base is simple.I maked herokuapp request version.
```vim
NeoBundle 'KazuakiM/vim-regexper'
```
Open browser method.  
1st command base.Exsample)Mac
```vim
let g:regexper#OpenCmd = 'open -a firefox'
```
Or 2nd use Vim plugin 'open-browser.vim'.
```vim
NeoBundle 'tyru/open-browser.vim'
```

###Usage
This command is starting [regexper](https://github.com/javallone/regexper), and show browser.  
It is sample.
```vim
:RegexperExecute /^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/
```


##Author
[KazuakiM](https://github.com/KazuakiM/)

##License
[Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported](http://creativecommons.org/licenses/by-nc-sa/3.0/)
