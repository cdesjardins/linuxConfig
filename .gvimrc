set hlsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
syntax on
