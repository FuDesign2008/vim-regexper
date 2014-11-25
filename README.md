#vim-qfsigns
This Vim plugin is inspired at [regexper](http://regexper.com/).

##Installation
This sample setting is request version that I maked herokuapp.  
You should install this plugin and set open browser.  

Plugin is installed.
```vim
NeoBundle 'KazuakiM/vim-regexper'
```
Open browser 2 methods.  
Use OS command base.Ex)Mac
```vim
let g:regexper#OpenCmd = 'open -a firefox'
```
Or Use Vim plugin 'open-browser.vim'.
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
