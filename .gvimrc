set hlsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
syntax on
let _curfile = expand("%:t")
if _curfile =~ "Makefile.*" || _curfile =~ "makefile.*" || _curfile =~ ".*\.mk"
    set noexpandtab
else
    set expandtab
endif
set smartindent
set ic
set nowrap
set incsearch
set number
set undolevels=10000
set tabpagemax=100
au BufReadPost Makefile.* set syntax=make
au BufReadPost *.aidl set syntax=java
set guioptions-=T
set guioptions+=c
