call plug#begin()
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' },
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets',
"Plug 'honza/vim-snipmate',
Plug 'brooth/far.vim',
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'lervag/vimtex',
Plug 'Raimondi/delimitMate',
"Plug 'BurningEther/iron.nvim',
Plug 'mklabs/split-term.vim',
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',
" Plug 'davidhalter/jedi-vim',
"Plug 'neovimhaskell/haskell-vim',
" Plug 'commercialhaskell/hindent',
" Plug 'Valloric/YouCompleteMe',
" Plug 'Rip-Rip/clang_complete',
" Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'w0rp/ale',
" Plug 'hhatto/autopep8',
" Plug 'Shougo/neosnippet.vim',
" Plug 'Shougo/neocomplcache',
" Plug 'Shougo/neocomplete',
" Plug 'Shougo/neosnippet',
" Plug 'Shougo/neosnippet-snippets'
call plug#end()

function ExecuteFile()
    let tail = expand("%:e")
    let name = expand("%:t:r")
    let command = ""
    if tail == "py"
        let command =  "python3 % < input.txt"
    elseif tail == "tex"
        let command =  "zathura " . name . ".pdf"
    else
        let command =  "./" . name . " < input.txt"
    endif
    exe "!" . command
endfunction

function CompileFile()
    let tail = expand("%:e")
    let name = expand("%:t:r")
    let command = ""
    if tail == "c"
        let command = "!gcc -g % -o " . name
    elseif tail == "cpp"
        let command = "!g++ -g % -o " . name
    elseif tail == 'hs'
        let command = "!ghc -dynamic % -o ".name
    elseif tail == 'tex'
        let command = "!pdflatex %"
    elseif tail == 'rs'
        let command = "!rustc % -o " . name
    endif
    exe command
endfunction

function DebugFile()
    let tail = expand("%:e")
    let name = expand("%:t:r")
    let command = ""
    if tail == "c"
        let command = "gdb " . name
    elseif tail == "cpp"
        let command = "gdb " . name
    elseif tail == 'hs'
        let command = "ghci " . name . "." . tail
    elseif tail == "py"
        let command = "python3 -m pdb " . name . "." . tail
    endif
    exe "VTerm " . command
endfunction

let g:UltiSnipsExpandTrigger ="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py"
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

colorscheme elflord

map <F2> :call CompileFile()<CR>
map <F3> :call ExecuteFile()<CR>
map <F4> :call DebugFile()<CR>
